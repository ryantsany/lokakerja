import 'package:lokakerja/model/db_helper.dart';
import 'package:lokakerja/model/contract.dart';
import 'package:lokakerja/widgets/job_container.dart';
import 'package:lokakerja/widgets/umkm_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'umkm_profile_page.dart';
import 'umkm_kontrak_page2.dart';
import 'umkm_pekerja_page.dart';

class UMKMHomePage extends StatefulWidget {
  const UMKMHomePage({
    super.key,
    required this.user_id,
    required this.username,
    required this.password,
  });

  final int user_id;
  final String username;
  final String password;

  @override
  State<UMKMHomePage> createState() => _UMKMHomePageState();
}

class _UMKMHomePageState extends State<UMKMHomePage> {
  int _currentIndex = 0;
  DatabaseHelper db = DatabaseHelper();
  List<Contract> contracts = <Contract>[];
  int count = 0;
  int workerCount = 0;
  int contractCount = 0;

  @override
  void initState() {
    super.initState();
    updateCount();
    updateListView();
  }

  void updateListView() async {
    List<Contract> newContract = await db.getContract(widget.user_id);
    newContract.sort((a, b) => b.id.compareTo(a.id));
    setState(() {
      contracts = newContract.take(4).toList();
      count = contracts.length;
    });
  }

  void updateCount() async {
    int newWorkerCount = await db.countWorkersByUserId(widget.user_id);
    int newContractCount = await db.countContractsByUserId(widget.user_id);
    setState(() {
      workerCount = newWorkerCount;
      contractCount = newContractCount;
    });
  }

  Widget body() {
    return ListView(
      children: [
        blueContainer(),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.only(right: 25, left: 25, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              infoCard("Jumlah Karyawan", workerCount.toString()),
              infoCard("Kontrak belum diambil", contractCount.toString()),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kontrak Kerja",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                itemCount: contracts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 175,
                ),
                itemBuilder: (context, index) {
                  return JobContainer(
                    jobTitle: contracts[index].job,
                    jobTime: contracts[index].jobDuration,
                    jobDistance: contracts[index].contractDuration,
                    money: contracts[index].salary,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget blueContainer() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 28, 125, 204),
            Color.fromARGB(255, 150, 213, 234),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 20, right: 20),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.notifications, color: Colors.white),
            ],
          ),
          const SizedBox(height: 35),
          const Center(
            child: Text(
              "LokaKerja!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoCard(String title, String value) {
    return Container(
      height: 100,
      width: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? body()
          : _currentIndex == 3
              ? ProfilePage()
              : _currentIndex == 2
                  ? PekerjaPage(widget.user_id)
                  : _currentIndex == 1
                      ? KontrakPage(widget.user_id)
                      : body(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0) {
            updateCount();
            updateListView();
          }
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

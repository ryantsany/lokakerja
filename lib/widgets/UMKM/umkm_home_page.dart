import 'package:dpbo_kelompok/widgets/job_container.dart';
import 'package:dpbo_kelompok/widgets/umkm_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'umkm_profile_page.dart';

class UMKMHomePage extends StatefulWidget {
  const UMKMHomePage({
    super.key,
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  State<UMKMHomePage> createState() => _UMKMHomePageState();
}

class _UMKMHomePageState extends State<UMKMHomePage> {
  int _currentIndex = 0;

  final List<List<String>> _jobList = [
    ["Nguli", "06.00 - 15.00", "2km"],
    ["Fotografer", "07.00 - 16.00", "3km"],
    ["Desain Logo", "08.00 - 17.00", "4km"],
    ["Membuat Web", "09.00 - 18.00", "5km"],
    ["Videografer", "10.00 - 19.00", "6km"],
  ];

 

  Widget body(){
    return ListView(
        children: [
          blueContainer(),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(right: 25,left: 25,bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Jumlah Karyawan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "20",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Kontrak kerja Aktif",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "20",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
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
                  itemCount: _jobList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    return JobContainer(jobTitle: _jobList[index][0], jobTime: _jobList[index][1], jobDistance: _jobList[index][2],);
                  },
                ),
              ],
            ),
          ),
        ],
      );
  }

  Widget blueContainer(){
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
                    // Search Bar
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? body() 
          : _currentIndex == 3
          ? ProfilePage()
          : body(), 
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

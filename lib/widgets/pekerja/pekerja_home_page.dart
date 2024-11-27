import "package:flutter/material.dart";

class PekerjaHomePage extends StatefulWidget {
  const PekerjaHomePage(
      {super.key, required this.username, required this.password});
  final String username;
  final String password;

  @override
  State<PekerjaHomePage> createState() => _PekerjaHomePageState();
}

class _PekerjaHomePageState extends State<PekerjaHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget body(){
    return ListView(
        children: [
          blueContainer(),
          const SizedBox(
            height: 20,
          ),
          mainContent(),
        ],
      );
  }

  Widget blueContainer(){
    return Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 28, 125, 204),
                Color.fromARGB(255, 150, 213, 234)
              ], begin: Alignment.bottomLeft, end: Alignment.topRight),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
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
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                const Center(
                    child: Text(
                  "LokaKerja!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0),
                )),
              ],
            ),
          );
  }

  Widget mainContent(){
    return Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sedang dikerjakan",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.work,
                        size: 50,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rizky Cookies", style: TextStyle(fontWeight: FontWeight.w700)),
                          Text("06.00 - 15.00", style: TextStyle(fontWeight: FontWeight.w600)),
                          Text("Jl. Bali No. 25", style: TextStyle(fontWeight: FontWeight.w600)),
                          Text("Bekerja hingga 20 November 2024", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Kerja terdekat",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 170),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){  },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Icon(Icons.work, size: 50),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    image: DecorationImage(
                                      image: Image.asset("assets/keripikkoki.jpeg").image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // ),
                                ),
                                // Icon(
                                //   Icons.bookmark,
                                //   size: 30,
                                //   color: Colors.grey,
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Koki",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.access_time_filled, size: 16),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "08.00 - 19.00",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on, size: 16),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "5 km",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                    
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
  }

  Widget bottomNavigationBar(){
    return BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 28, 125, 204),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.window_rounded),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: "Pekerjaan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_rounded),
            label: "Simpan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: "Profil",
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      );
  }

}

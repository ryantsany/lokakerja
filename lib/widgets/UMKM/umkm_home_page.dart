import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
                    Container(
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
                    Container(
                      // width: 270,
                      width: 330,
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
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
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
                )
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
    
          const SizedBox(height: 20),
          Center(
            child: Text(
              "Welcome, ${widget.username}!",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),

      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.window_sharp),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases_outlined),
            label: "Kontrak",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_rounded),
            label: "Pekerja",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
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
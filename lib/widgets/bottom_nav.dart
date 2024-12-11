import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: const Color.fromARGB(255, 28, 125, 204),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.window_sharp),
          label: "Beranda",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: "Pekerjaan",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_rounded),
          label: "Aktifitas",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_rounded),
          label: "Profil",
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
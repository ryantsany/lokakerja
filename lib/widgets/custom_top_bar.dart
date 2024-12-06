import "package:flutter/material.dart";

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 29),
      decoration:  BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 28, 125, 204),
          Color.fromARGB(255, 150, 213, 234)
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                "Profil",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              )),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ],
          ),
          // const SizedBox(
          //   height: 35,
          // ),
          // const Center(
          //     child: Text(
          //   "LokaKerja!",
          //   style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 40,
          //       fontWeight: FontWeight.bold,
          //       letterSpacing: 2.0),
          // )),
        ],
      ),
    );
  }
}
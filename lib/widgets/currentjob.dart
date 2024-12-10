import 'package:flutter/material.dart';

class Currentjob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Text("Rizky Cookie",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text("06.00 - 15.00",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Text("Jl. Bali No. 25",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Text("Bekerja hingga 20 November 2024",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                )
              ],
            ),
          );
  }
}
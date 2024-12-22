import 'package:flutter/material.dart';
import 'package:lokakerja/pages/UMKM/umkm_kontrak_page2.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';
import 'package:lokakerja/widgets/tab_button.dart';
import 'package:flutter/widgets.dart';

class KontrakPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          CustomTopBar(title: "Kontrak", icon: Icons.work),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabButton(
                text: "Buka Lowongan",
                isActive: true,
                onTap: () {},
              ),
              TabButton(
                text: "Lowongan aktif",
                isActive: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => KontrakPage()));
                },
              ),
            ],
          ),

          const SizedBox(height: 5),

          
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Buka Lowongan\nKerja Baru",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

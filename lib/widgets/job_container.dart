import 'package:flutter/material.dart';

class JobContainer extends StatelessWidget {
  String jobTitle;
  String jobTime;
  String jobDistance;
  String money;
  String imgPath;

  JobContainer(
      {super.key,
      required this.jobTitle,
      required this.jobTime,
      required this.jobDistance,
      required this.money,

      required this.imgPath});

  @override
  Widget build(BuildContext context) {
    InkWell myJobContainer = InkWell(
      onTap: () {},
      child: Container(
        // padding: const EdgeInsets.all(10),
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: 100,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  image: Image.asset("assets/keripikkoki.jpeg").image,
                  fit: BoxFit.cover,
                ),
              ),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobTitle,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time_filled, size: 16),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        jobTime,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on, size: 16),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        jobDistance,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.money, size: 16),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        jobDistance,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return myJobContainer;
  }
}

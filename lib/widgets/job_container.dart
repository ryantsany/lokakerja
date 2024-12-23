import 'package:flutter/material.dart';

class JobContainer extends StatelessWidget {
  final String jobTitle;
  final String jobTime;
  final String jobDistance;
  final String money;
  final String imgPath;

  JobContainer({
    super.key,
    required this.jobTitle,
    required this.jobTime,
    required this.jobDistance,
    required this.money,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    InkWell myJobContainer = InkWell(
      onTap: () {},
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  image: Image.asset(imgPath).image,
                  fit: BoxFit.cover,
                ),
              ),
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
                      const SizedBox(width: 5),
                      Text(
                        jobTime,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.timer, size: 16),
                      const SizedBox(width: 5),
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
                      const SizedBox(width: 5),
                      Text(
                        money,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
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

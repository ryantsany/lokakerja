import 'package:flutter/material.dart';

class PekerjaContainer extends StatelessWidget {
  final String workerName;
  final String jobTitle;
  final String jobTime;
  final String money;

  PekerjaContainer({
    super.key,
    required this.workerName,
    required this.jobTitle,
    required this.jobTime,
    required this.money,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(
            Icons.work,
            size: 50,
            color: Colors.black.withOpacity(0.7),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.person, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      workerName,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.work_outline, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      jobTitle,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
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
    );
  }
}
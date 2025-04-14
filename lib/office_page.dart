import 'package:flutter/material.dart';
import 'result_page.dart';

class OfficePage extends StatefulWidget {
  const OfficePage({super.key});

  @override
  State<OfficePage> createState() => _OfficePageState();
}

class _OfficePageState extends State<OfficePage> {
  int peopleCount = 1;
  int roomCount = 1;
  int areaCount = 1;
  int acCount = 1;
  int fridgeCount = 1;
  int computerCount = 1;
  int plantCount = 1;
  int burnerCount = 1;

  Widget buildCounterRow(String label, int count, VoidCallback onIncrement, VoidCallback onDecrement) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            iconSize: 18,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
            onPressed: onDecrement,
          ),
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 18,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
            onPressed: onIncrement,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centered logo + Office text
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/office_logo.png',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Office',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // All counters
            buildCounterRow('Total number of people', peopleCount, () {
              setState(() => peopleCount++);
            }, () {
              setState(() {
                if (peopleCount > 1) peopleCount--;
              });
            }),

            buildCounterRow('Total number of rooms', roomCount, () {
              setState(() => roomCount++);
            }, () {
              setState(() {
                if (roomCount > 0) roomCount--;
              });
            }),

            buildCounterRow('Total area (sqft.)', areaCount, () {
              setState(() => areaCount++);
            }, () {
              setState(() {
                if (areaCount > 0) areaCount--;
              });
            }),

            buildCounterRow('Total AC', acCount, () {
              setState(() => acCount++);
            }, () {
              setState(() {
                if (acCount > 0) acCount--;
              });
            }),

            buildCounterRow('Total Refrigerator', fridgeCount, () {
              setState(() => fridgeCount++);
            }, () {
              setState(() {
                if (fridgeCount > 0) fridgeCount--;
              });
            }),

            buildCounterRow('Total Computers', computerCount, () {
              setState(() => computerCount++);
            }, () {
              setState(() {
                if (computerCount > 0) computerCount--;
              });
            }),

            buildCounterRow('Total indoor plants', plantCount, () {
              setState(() => plantCount++);
            }, () {
              setState(() {
                if (plantCount > 0) plantCount--;
              });
            }),

            buildCounterRow('Total kitchen burner', burnerCount, () {
              setState(() => burnerCount++);
            }, () {
              setState(() {
                if (burnerCount > 0) burnerCount--;
              });
            }),

            const Spacer(),

            // Calculate Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Calculate Carbon Emission',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

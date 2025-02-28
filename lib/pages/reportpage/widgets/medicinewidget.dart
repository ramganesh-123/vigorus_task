import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigorus_task/controllers/calpolcontroller.dart';
import 'package:vigorus_task/controllers/homecontroller.dart';
import 'package:vigorus_task/controllers/reportcontroller.dart';

class Medicinewidget extends StatelessWidget {
  Medicinewidget({super.key});
  final Calpolcontroller controller = Get.put(Calpolcontroller());
  final HomeController homecontroller = Get.put(HomeController());
  final Reportcontroller reportcontroller = Get.put(Reportcontroller());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        Map<String, List<Medicine>> timeGroups = {};
        for (var medicine in controller.medicines) {
          if (!timeGroups.containsKey(medicine.time.split(' ')[0])) {
            timeGroups[medicine.time.split(' ')[0]] = [];
          }
          timeGroups[medicine.time.split(' ')[0]]!.add(medicine);
        }

        return ListView.builder(
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: timeGroups.length,
          itemBuilder: (context, index) {
            String timeGroup = timeGroups.keys.elementAt(index);
            List<Medicine> medicinesInGroup = timeGroups[timeGroup]!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    medicinesInGroup.first.time,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ...medicinesInGroup.map((medicine) {
                  return Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: medicine.color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(medicine.icon, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  medicine.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      medicine.instructions,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      'Day ${medicine.day.toString().padLeft(2, '0')}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          getMedicineStatusIcon(medicine.status),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        );
      }),
    );
  }

  Widget getMedicineStatusIcon(MedicineStatus status) {
    switch (status) {
      case MedicineStatus.taken:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.notifications_none_outlined, color: Colors.green),
            Text(
              'Taken',
              style: TextStyle(
                fontSize: 10,
              ),
            )
          ],
        );
      case MedicineStatus.missed:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.notifications_none_outlined, color: Colors.red),
            Text(
              'Missed',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        );
      case MedicineStatus.snoozed:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.notifications_none_outlined, color: Colors.orange),
            Text(
              'Snoozed',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        );
      case MedicineStatus.left:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.notifications_none_outlined, color: Colors.grey),
            Text(
              '     Left     ',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        );
    }
  }
}

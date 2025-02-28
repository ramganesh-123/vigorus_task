import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigorus_task/controllers/addmedicinecontroller.dart';
import 'package:vigorus_task/pages/addmedicinepage/widgets/addbuttonwidget.dart';
import 'package:vigorus_task/pages/addmedicinepage/widgets/colorsectionwidget.dart';
import 'package:vigorus_task/pages/addmedicinepage/widgets/compartmentwidget.dart';
import 'package:vigorus_task/pages/addmedicinepage/widgets/datesectionwidget.dart';
import 'package:vigorus_task/pages/addmedicinepage/widgets/daysectionwidget.dart';
import 'package:vigorus_task/pages/addmedicinepage/widgets/frequencysectionwidget.dart';
import 'package:vigorus_task/pages/addmedicinepage/widgets/qualitysectionwidget.dart';
import 'package:vigorus_task/pages/addmedicinepage/widgets/searchwidget.dart';
import 'package:vigorus_task/pages/addmedicinepage/widgets/takingtimewidget.dart';
import 'package:vigorus_task/pages/addmedicinepage/widgets/timingsectionwidget.dart';
import 'package:vigorus_task/pages/addmedicinepage/widgets/totalcountsectionwidget.dart';
import 'package:vigorus_task/pages/addmedicinepage/widgets/typesectionwidget.dart';

class AddMedicineScreen extends StatelessWidget {
  AddMedicineScreen({super.key});
  final AddMedicineController controller = Get.put(AddMedicineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 10,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Add Medicines',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              const SizedBox(height: 20),
              Compartmentwidget(),
              const SizedBox(height: 20),
              Colorsectionwidget(),
              const SizedBox(height: 20),
              Typesectionwidget(),
              const SizedBox(height: 20),
              Qualitysectionwidget(),
              const SizedBox(height: 20),
              Totalcountsectionwidget(),
              const SizedBox(height: 20),
              Datesectionwidget(),
              const SizedBox(height: 20),
              Frequencysectionwidget(),
              const SizedBox(height: 20),
              Daysectionwidget(),
              const SizedBox(height: 20),
              Timingsectionwidget(),
              const SizedBox(height: 20),
              Takingtimewidget(),
              const SizedBox(height: 30),
              Addbuttonwidget(),
            ],
          ),
        ),
      ),
    );
  }
}

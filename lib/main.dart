import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vigorus_task/approuter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'vigorus-task',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: "/",
      navigatorObservers: [routeObserver],
      getPages: AppRouter.routers,
    ),
  );
}

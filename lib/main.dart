import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:weatherapp_starter_project/src/screens/home_screen.dart';
=======

import 'src/screens/home_page.dart';
>>>>>>> 5146ff6bf519ad4c258555ae83bac6646264432a

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
      title: 'Weather',
      debugShowCheckedModeBanner: false,
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 5146ff6bf519ad4c258555ae83bac6646264432a

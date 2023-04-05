import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/src/controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = '';
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(
      globalController.getLatitude().value,
      globalController.getLongitude().value,
    );
    super.initState();
  }

  getAddress(lat, lng) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lng);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(city),
        )
      ],
    );
  }
}

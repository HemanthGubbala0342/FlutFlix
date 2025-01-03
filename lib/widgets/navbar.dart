import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return mobileNavbar();
        } else {
          return desktopNavbar();
        }
      },
    );
  }

  Widget mobileNavbar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu),
        Text(
          "FlutFlix",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 15),
            Icon(Icons.notifications),
          ],
        ),
      ],
    );
  }

  Widget desktopNavbar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:350),
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
          ),
        ]
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu),
          Text(
            "FlutFlix",
            style: TextStyle(
              letterSpacing: 1,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: 35),
              Icon(Icons.notifications),
            ],
          ),
        ],
      ),
    );
  }
}

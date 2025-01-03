import 'package:flutflix/Pages/Containers/container1.dart';
import 'package:flutflix/Pages/Containers/container2.dart';
import 'package:flutflix/Pages/Containers/container3.dart';
import 'package:flutflix/widgets/navbar.dart';
import 'package:flutter/material.dart';

class MyhomePage extends StatelessWidget {
  const MyhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            child: Column(
              children: [
                Navbar(),
                SizedBox(height: 15),
                Container1(),
                SizedBox(height: 15),
                Container2(),
                SizedBox(height: 15),
                Container3(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

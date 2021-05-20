import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Hive.openBox("student");
    return Scaffold(
      body: Center(
        child: Text(
          Hive.box("student").get("1.") ?? "Muharram",
        ),
      ),
    );
  }
}

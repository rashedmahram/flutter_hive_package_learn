import 'package:flutter/material.dart';
import 'package:flutter_local_data_save/screen/details.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  Hive.initFlutter();
  // Hive.openBox("students");

  // Hive.box("students").put("names", names);
  runApp(MyApp());
  // print(Hive.box("students"));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                keyBox: "1.",
                valueBox: "Muharram",
                nameBox: "student",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatefulWidget {
  const Button({
    Key key,
    this.keyBox,
    this.valueBox,
    this.nameBox,
  }) : super(key: key);
  final String keyBox;
  final String valueBox;
  final String nameBox;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  void disspose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await Hive.openBox(widget.nameBox);
        Hive.box(widget.nameBox).put(widget.keyBox, widget.valueBox);
        var box2 = Hive.box(widget.nameBox).get(widget.keyBox);
        print(box2);
        // Hive.box(nameBox).close();
        print("Saved\n");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details()),
        );
      },
      child: Container(
        height: 100,
        width: 100,
        color: Colors.green,
        alignment: Alignment.center,
        child: Text(
          "Button",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

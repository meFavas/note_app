import 'package:flutter/material.dart';

class Homescreencontroller {
  static TextEditingController titlecontroller = TextEditingController();
  static TextEditingController descontroller = TextEditingController();
  static TextEditingController datecontroller = TextEditingController();
  static Color selectcolor = Colors.white;
  List notelist = [];
  void addData() {
    notelist.add(
      {
        "title": titlecontroller.text,
        "des": descontroller.text,
        "date": datecontroller.text,
        "color": selectcolor,
      },
    );
  }

  void deleteData(int index) {
    notelist.removeAt(index);
  }

  static void cleardata() {
    titlecontroller.clear();
    descontroller.clear();
    datecontroller.clear();
  }

  void onColorselection(newcolor) {
    selectcolor = newcolor;
  }

  void editdata(int index) {
    notelist[index] = {
      "title": titlecontroller.text,
      "des": descontroller.text,
      "date": datecontroller.text,
      "color": selectcolor,
    };
  }
}

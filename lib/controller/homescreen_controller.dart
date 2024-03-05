import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Homescreencontroller {
  static TextEditingController titlecontroller = TextEditingController();
  static TextEditingController descontroller = TextEditingController();
  static TextEditingController datecontroller = TextEditingController();
  static Color selectcolor = Colors.white;
  List notelist = [];
  List notekeys = [];
  var mybox = Hive.box("notebox");
  void addData() {
    mybox.add({
      "title": titlecontroller.text,
      "des": descontroller.text,
      "date": datecontroller.text,
      // "color": selectcolor,
    });
    notekeys = mybox.keys.toList();
    // notelist.add(
    //   {
    //     "title": titlecontroller.text,
    //     "des": descontroller.text,
    //     "date": datecontroller.text,
    //     "color": selectcolor,
    //   },
    // );
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

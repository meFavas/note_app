import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Homescreencontroller {
  static TextEditingController titlecontroller = TextEditingController();
  static TextEditingController descontroller = TextEditingController();
  static TextEditingController datecontroller = TextEditingController();
  static Color selectcolor = Colors.white;
  static List colorlist = [
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.green,
  ];
  static int selectColorindex = 0;
  // List notelist = [];
  List notekeys = [];
  var mybox = Hive.box("notebox");
  void addData() {
    mybox.add({
      "title": titlecontroller.text,
      "des": descontroller.text,
      "date": datecontroller.text,
      "color": selectColorindex,
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

  void deleteData(var key) {
    mybox.delete(key);
    notekeys = mybox.keys.toList();
  }

  static void cleardata() {
    titlecontroller.clear();
    descontroller.clear();
    datecontroller.clear();
  }

  void onColorselection(int newcolorindex) {
    selectColorindex = newcolorindex;
  }

  void editdata(var key) {
    mybox.put(key, {
      "title": titlecontroller.text,
      "des": descontroller.text,
      "date": datecontroller.text,
      "color": selectColorindex,
    });
  }

  init() {
    notekeys = mybox.keys.toList();
  }
}

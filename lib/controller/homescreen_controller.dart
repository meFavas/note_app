import 'package:flutter/material.dart';

class Homescreencontroller {
  static TextEditingController titlecontroller = TextEditingController();
  static TextEditingController descontroller = TextEditingController();
  static TextEditingController datecontroller = TextEditingController();
  static Color selectcolor = Colors.white;
  List notelist = [
    {
      "title": "Title",
      "des":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "date": "mon,jun,20,2024",
      "color": Colors.blue,
    }
  ];
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
}

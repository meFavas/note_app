// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:note_app/controller/homescreen_controller.dart';
import 'package:note_app/utils/color_constants.dart';
import 'package:note_app/utils/database.dart';

import 'package:note_app/view/customcard/customcard.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List colorlist = [
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.green,
  ];
  int selectedindex = 0;

  Homescreencontroller homescreencontrollerobj = Homescreencontroller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstants.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "NotePad",
            style: TextStyle(
                color: Colorconstants.blue,
                fontWeight: FontWeight.w600,
                fontSize: 30,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Customcard(
                title: homescreencontrollerobj.notelist[index]["title"],
                des: homescreencontrollerobj.notelist[index]["des"],
                date: homescreencontrollerobj.notelist[index]["date"],
                colorlist: homescreencontrollerobj.notelist[index]["color"],
                ondeletepressed: () {
                  homescreencontrollerobj.deleteData(index);
                  setState(() {});
                },
              ),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: homescreencontrollerobj.notelist.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: StatefulBuilder(
                builder: (context, bottomsetState) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: Colorconstants.black),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: Homescreencontroller.titlecontroller,
                          decoration: InputDecoration(
                              label: Text("Title"),
                              border: OutlineInputBorder(),
                              fillColor: Colorconstants.black,
                              filled: true),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: Homescreencontroller.descontroller,
                          decoration: InputDecoration(
                              label: Text("Description"),
                              border: OutlineInputBorder(),
                              fillColor: Colorconstants.black,
                              filled: true),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: Homescreencontroller.datecontroller,
                          decoration: InputDecoration(
                              label: Text("Date"),
                              border: OutlineInputBorder(),
                              fillColor: Colorconstants.black,
                              filled: true),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: colorlist.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  selectedindex = index;
                                  Homescreencontroller objcolor =
                                      Homescreencontroller();
                                  objcolor.onColorselection(colorlist[index]);
                                  bottomsetState(() {});
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: selectedindex == index
                                        ? Border.all(
                                            width: 2,
                                            color: Colorconstants.white)
                                        : null,
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colordb.colorlist[index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  Homescreencontroller.cleardata();
                                },
                                child: Container(
                                  child: Center(child: Text("Cancel")),
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colorconstants.grey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  homescreencontrollerobj.addData();
                                  Homescreencontroller.cleardata();

                                  setState(() {});

                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: Center(child: Text("Save")),
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colorconstants.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }



  
}

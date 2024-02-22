// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:note_app/utils/color_constants.dart';

class Customcard extends StatefulWidget {
  const Customcard({
    super.key,
    required this.title,
    required this.des,
    required this.date,
    required this.colorlist,
    this.ondeletepressed,
  });
  final String title;
  final String des;
  final String date;
  final Color colorlist;
  final VoidCallback? ondeletepressed;

  @override
  State<Customcard> createState() => _CustomcardState();
}

class _CustomcardState extends State<Customcard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.colorlist,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colorconstants.black,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.ondeletepressed,
                      icon: Icon(
                        Icons.delete,
                        color: Colorconstants.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  widget.des,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 160,
                  ),
                  Text(
                    widget.date,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(Icons.share),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:to_do/utils/Buttons.dart';

class Dialogue extends StatelessWidget {
  
  final controller;
  VoidCallback onpressed;
  VoidCallback pop;


  Dialogue({super.key, required this.controller , required this.onpressed , required this.pop});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "Add New Task",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buttons(
                  text: "Save",
                  onpressed: onpressed,
                ),
                SizedBox(
                  width: 7,
                ),
                buttons(
                  text: "Cancel",
                  onpressed:pop,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

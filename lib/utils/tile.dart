import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class tile extends StatelessWidget {
  final String text;
  final taskcompleted;
  Function(bool?)? OnChanged;
  Function(BuildContext)? deleteTask;

  final Color color = Colors.yellow;
  final double radius = 12;
  tile({
    required this.text,
    required this.taskcompleted,
    required this.OnChanged,
    required this.deleteTask,
    color,
    radius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0, left: 35, right: 35),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
           children: [
             SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade400,
              borderRadius: BorderRadius.circular(12),
              )
           ]
           ),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: taskcompleted,
                   onChanged: OnChanged,
                   activeColor: Colors.green,
                   ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    decoration: taskcompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

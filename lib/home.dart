import 'package:flutter/material.dart';
import 'package:to_do/database.dart';
import 'package:to_do/utils/Dialogue.dart';
import 'package:to_do/utils/tile.dart';
import 'package:hive_flutter/hive_flutter.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  final _mybox = Hive.box("mybox");

  @override
  void initState() {
    if(_mybox.get("todoList") == null)
    {
       db.createInitData();
      
    }
    else
    {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

   to_do_Database db = to_do_Database();

  bool? onChanged(index) {
    setState(() {
      db.tasks[index][1] = !db.tasks[index][1];
      return db.tasks[index][1];
    });
    db.updateDatbase();
  }

  deleteTask(index)
  {
     setState(() {
       db.tasks.removeAt(index);
     });
     db.updateDatbase();
  }

    void pop(context) {
    Navigator.pop(context);
    db.updateDatbase();
  }

  //  String errorText = "";  

  void onSavetask()
  {
    setState(() {
      // print('11212');
      if(_controller.text.trim().length == 0)
      {
         // * Snack Bar Coming * //
      }
      else{
      db.tasks.add([_controller.text , false]);
      _controller.clear();
      }
    });
    db.updateDatbase();
  }

  void createTask() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialogue(
          controller: _controller,
          pop: () => pop(context),
          onpressed:() => onSavetask(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 254, 239, 239),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "To-Do List",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: db.tasks.length,
        itemBuilder: (context, index) {
          return tile(
            text: db.tasks[index][0],
            taskcompleted: db.tasks[index][1],
            OnChanged: (value) => onChanged(index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}

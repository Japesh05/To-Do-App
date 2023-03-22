import 'package:hive_flutter/hive_flutter.dart';

class to_do_Database {
  List tasks = [];
  final _mybox = Hive.box('mybox');

  //! first time ever opening the app
  void createInitData() {
    tasks = [
      ["Go for a Jog", false],
      ["Study for 2 hours", false]
    ];
  }

  //! load data
  void loadData() {
    tasks = _mybox.get("todoList");
  }

  //! update Database
  void updateDatbase()
  {
    _mybox.put('todoList', tasks);
  }
}

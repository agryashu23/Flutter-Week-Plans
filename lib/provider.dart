import 'package:flutter/material.dart';

class FormModel extends ChangeNotifier {
  List weight = [];
  List task = [];
  List work = [];
  List weekdays = [];
  List daywork = [];
  List weekwork = [];
  TextEditingController controller = new TextEditingController(text: "10");
  TextEditingController tController = new TextEditingController(text: "60");


  void addTask(tasks,date,time){
    task.add({'date':date,'task':tasks,'time':time});
    notifyListeners();
  }
  void addWorkout(title,image){
    work.add({"title":title,"image":image});
    notifyListeners();
  }

  void addDays(title,subtitle){
    weekdays.add({"title":title,"subtitle":subtitle});
    notifyListeners();
  }
  void daysWork(title){
    daywork.add({"title":title,"Monday":[],"Tuesday":[],"Wednesday":[],"Thursday":[],"Friday":[],"Saturday":[],"Sunday":[]});
    notifyListeners();
  }

}
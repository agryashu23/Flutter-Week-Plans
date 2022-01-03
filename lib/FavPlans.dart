import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../Days.dart';
import '../provider.dart';

class FavPlans extends StatefulWidget {
  const FavPlans({Key? key}) : super(key: key);

  @override
  _FavPlansState createState() => _FavPlansState();
}

class _FavPlansState extends State<FavPlans> {
  TextEditingController taskController = TextEditingController();
  TextEditingController task1Controller = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController desc1Controller = TextEditingController();

  // @override
  // void dispose() {
  //   taskController.dispose();
  //   task1Controller.dispose();
  //   descController.dispose();
  //   desc1Controller.dispose();
  //   super.dispose();
  // }



  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child) {
      bool wid = false;
      var hSize = MediaQuery.of(context).size.height;
      var wSize = MediaQuery.of(context).size.width;
      return Scaffold(
        appBar: AppBar(
          title: Text("Your Plans"),
        ),
        body: Container(
          height: hSize * 0.6,
          child: gym.weekdays.length != 0
              ? ListView.builder(
                  itemCount: gym.weekdays.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>WeekDays(task:gym.weekdays[index]['title'],
                      ))),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        width: wSize * 0.8,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Icon(
                                MdiIcons.calendarAccountOutline,
                                size: 30,
                              ),
                            ),
                            Container(
                              height: hSize * 0.1,
                              width: wSize * 0.5,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      gym.weekdays[index]['title'],
                                      style: GoogleFonts.balooBhai(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    gym.weekdays[index]['subtitle'],
                                    style: GoogleFonts.balooBhai(
                                      fontSize: 16,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(left: wSize * 0.1),
                              child: IconButton(
                                iconSize: 30,
                                icon: Icon(Icons.more_vert),
                                onPressed: () =>
                                    _displayDots(context, gym,index),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : Container(
                  child: Center(
                    child: Text("Add Some Plans"),
                  ),
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {
            _displayPlanTask(context, gym);
          },
        ),
      );
    });
  }

  Future<void> _displayPlanTask(BuildContext context, FormModel gym) async {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              // title: Text('ADD PLAN',textAlign: TextAlign.center,),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white60,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 8,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "Plan Detail",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: TextField(
                              // autofocus: true,
                              maxLength: 50,
                              controller: taskController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                counterText: '',
                                labelText: "    Task Name",
                                labelStyle: TextStyle(color: Colors.blue),
                                // border: InputBorder.none,
                              ),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 15, left: 10, right: 10, bottom: 10),

                            // decoration: BoxDecoration(
                            //       border: Border.all(color: Colors.black38),
                            //       borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              // autofocus: true,
                              maxLength: 50,
                              controller: descController,
                              decoration: InputDecoration(
                                counterText: '',
                                labelText: "   Description (Optional)",
                                labelStyle: TextStyle(color: Colors.blue),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: 10,
                                left: MediaQuery.of(context).size.width * 0.16,
                                bottom: 10),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(children: [
                              Icon(
                                MdiIcons.calendarCheckOutline,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Weekly Plan',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.blue),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.66,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  color: Colors.blue.shade400,
                  child: TextButton(
                    child: Text(
                      'CREATE PLAN',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () async {
                      if (taskController.text.toString().isNotEmpty) {
                        if(gym.weekdays.isNotEmpty){
                          gym.weekdays.forEach((element) {
                            if(element["title"]==taskController.text.toString()){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Task Name Already Exists!')));
                            }
                            else{
                              setState(() {
                                gym.addDays(taskController.text.toString(),
                                    descController.text.toString());
                                Navigator.of(context).pop();
                                gym.daysWork(taskController.text.toString()
                                );
                              });
                            }
                          });
                        }
                        else{
                          setState(() {
                            gym.addDays(taskController.text.toString(),
                                descController.text.toString());
                            Navigator.of(context).pop();
                            gym.daysWork(taskController.text.toString());
                            taskController.clear();
                            descController.clear();
                          });
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please Enter Task!')));
                      }
                    },
                  ),
                ),
              ],
            );
          });
        });
  }Future<void> _displaySecondTask(BuildContext context, FormModel gym,index) async {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              // title: Text('ADD PLAN',textAlign: TextAlign.center,),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white60,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 8,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "Plan Detail",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: TextField(
                              // autofocus: true,
                              maxLength: 50,
                              controller: task1Controller,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                counterText: '',
                                labelText: "    Task Name",
                                labelStyle: TextStyle(color: Colors.blue),
                                // border: InputBorder.none,
                              ),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 15, left: 10, right: 10, bottom: 10),

                            // decoration: BoxDecoration(
                            //       border: Border.all(color: Colors.black38),
                            //       borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              // autofocus: true,
                              maxLength: 50,
                              controller: desc1Controller,
                              decoration: InputDecoration(
                                counterText: '',
                                labelText: "   Description (Optional)",
                                labelStyle: TextStyle(color: Colors.blue),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: 10,
                                left: MediaQuery.of(context).size.width * 0.16,
                                bottom: 10),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(children: [
                              Icon(
                                MdiIcons.calendarCheckOutline,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Weekly Plan',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.blue),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.66,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  color: Colors.blue.shade400,
                  child: TextButton(
                    child: Text(
                      'UPDATE PLAN',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () async {
                      if (taskController.text.toString().isNotEmpty) {
                        setState(() {
                         gym.weekdays[index]['title'] = task1Controller.text.toString();
                         gym.weekdays[index]['subtitle'] = desc1Controller.text.toString();
                          Navigator.of(context).pop();
                          gym.daywork.forEach((element) {
                            if(element['title']==taskController.text.toString()){
                              element['title'] = task1Controller.text.toString();
                            }
                          });
                          task1Controller.clear();
                          desc1Controller.clear();
                        });

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please Enter Task!')));
                      }
                    },
                  ),
                ),
              ],
            );
          });
        });
  }

  void _displayDots(BuildContext context, FormModel gym, index) async {
    var hSize = MediaQuery.of(context).size.height;
    var wSize = MediaQuery.of(context).size.width;
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      context: context,
      pageBuilder: (context, anim1, anim2) {
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 10),
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, bottom: 5),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: wSize * 0.16,
                          ),
                          Text(
                            "ACTIONS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 4,
                      color: Colors.black12,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                        _displaySecondTask(context, gym,index);

                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 15, top: 15),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.fileEdit,
                              size: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(width: wSize * 0.08),
                            Text(
                              "Edit",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Row(
                        children: [
                          Icon(
                            MdiIcons.refreshCircle,
                            size: 30,
                            color: Colors.green,
                          ),
                          SizedBox(width: wSize * 0.08),
                          Text(
                            "Reset",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                          _displayTextInput(context, gym, index);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 15, top: 15),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.delete,
                              size: 30,
                              color: Colors.red,
                            ),
                            SizedBox(width: wSize * 0.08),
                            Text(
                              "Delete",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  Future<void> _displayTextInput(BuildContext context, FormModel gym,index) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ChangeNotifierProvider.value(value: context.read<FormModel>(),

            child: AlertDialog(
              title: Text('Confirmation'),
              content: Text("Are you sure want to delete task?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () async {
                        setState(() {
                          gym.weekdays.removeWhere((element) =>
                              element['title'] ==
                              taskController.text.toString());
                        });
                        print(gym.weekdays);
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok")),
              ],
            ),
          );
          });
  }
}

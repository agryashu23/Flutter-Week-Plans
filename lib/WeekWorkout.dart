import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'dialog.dart';

class WeekWorkout extends StatefulWidget {
  const WeekWorkout({Key? key, required this.title, required this.task, required this.notifyParent})
      : super(key: key);

  final String title;
  final Function notifyParent;
  final String task;

  @override
  _WeekWorkoutState createState() => _WeekWorkoutState();
}

class _WeekWorkoutState extends State<WeekWorkout> {
  final List workout = [
    {
      'title': "Chest",
      'image': 'assets/images/chest.jpg',
      'subtitle': [
        {
          'title': "Barbell Bench Press",
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': "Barbell Incline Bench \n Press",
          'image': "assets/images/bicep.jpg"
        },
        {
          'title': "Incline Dumbbell Fly",
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': "Cable Crossover",
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': "Incline Dumbbell Press",
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': "Barbell Decline Bench  \n Press",
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': "Dumbbell Pullover",
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': "Seated Machine Chest  \n Press",
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': "Butterfly Chest Press",
          'image': "assets/images/barbell-chest.jpg"
        },
      ]
    },
    {
      'title': "Back",
      'image': 'assets/images/Back.jpg',
      'subtitle': [
        {'title': "DeadLift", 'image': "assets/images/barbell-chest.jpg"},
        {'title': "Bent-Over Row", 'image': "assets/images/barbell-chest.jpg"},
        {'title': "Single-Arm Row", 'image': "assets/images/barbell-chest.jpg"},
        {'title': "Lat Pulldown", 'image': "assets/images/barbell-chest.jpg"},
        {
          'title': "Neutral Grip Pulldown",
          'image': "assets/images/barbell-chest.jpg"
        },
        {'title': "Landmine Row", 'image': "assets/images/barbell-chest.jpg"},
        {
          'title': "Seated Cable Row",
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': "Pallof Press Iso  \n Hold",
          'image': "assets/images/barbell-chest.jpg"
        },
      ]
    },
    {
      'title': 'Shoulder',
      'image': 'assets/images/shoulder.jpg',
      'subtitle': [
        {'title': 'Overhead Press', 'image': "assets/images/barbell-chest.jpg"},
        {
          'title': 'Standing Dumbbell Fly',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Clean and Press',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Machine Shoulder Press',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Bentover Reverse Fly',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Single-Arm Cable Front \n  Raise',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Barbell Shoulder Press',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Single Hand Front Raise',
          'image': "assets/images/barbell-chest.jpg"
        },
        {'title': 'Dumbell Shrugs', 'image': "assets/images/barbell-chest.jpg"},
        {
          'title': 'Barbell Reverse Shrugs',
          'image': "assets/images/barbell-chest.jpg"
        },
      ]
    },
    {
      'title': 'Biceps',
      'image': 'assets/images/bicep.jpg',
      'subtitle': [
        {'title': ' Hammer Curl', 'image': "assets/images/barbell-chest.jpg"},
        {
          'title': ' Regular EZ Bar Curl',
          'image': "assets/images/barbell-chest.jpg"
        },
        {'title': ' Dumbell Curl', 'image': "assets/images/barbell-chest.jpg"},
        {
          'title': 'Reverse Curl Straight \n  Bar',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Standing Cable Curl',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Standing Barbell Curl',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'EZ-Bar Preacher Curl',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Cable Rope Supinating \n Curl',
          'image': "assets/images/barbell-chest.jpg"
        },
      ]
    },
    {
      'title': 'Triceps',
      'image': 'assets/images/tricep.jpg',
      'subtitle': [
        {
          'title': 'Close-grip Bench Press',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Rope Tricep Pushdown',
          'image': "assets/images/barbell-chest.jpg"
        },
        {'title': 'Tricep Dips', 'image': "assets/images/barbell-chest.jpg"},
        {
          'title': 'Hand Tricep Dips',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Close-grip Bench Press',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': ' Underhand Cable Pushdowns',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Rod Tricep Pushdown',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': ' Banded Pushdowns',
          'image': "assets/images/barbell-chest.jpg"
        },
      ]
    },
    {
      'title': 'Legs',
      'image': 'assets/images/legs.jpg',
      'subtitle': [
        {'title': 'Leg curl', 'image': "assets/images/barbell-chest.jpg"},
        {'title': 'Leg Extension', 'image': "assets/images/barbell-chest.jpg"},
        {'title': 'Leg Press', 'image': "assets/images/barbell-chest.jpg"},
        {'title': 'Goblet Squat', 'image': "assets/images/barbell-chest.jpg"},
        {'title': 'Barbell Squats', 'image': "assets/images/barbell-chest.jpg"},
        {
          'title': 'Dumbbell Forward Lunges',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Barbell Hip Thrust',
          'image': "assets/images/barbell-chest.jpg"
        },
        {
          'title': 'Standing Leg Press',
          'image': "assets/images/barbell-chest.jpg"
        },
      ]
    },
  ];
  refresh() {
    setState(() {});
  }
  bool text = false;
  String? selected;
  String? selectedC;
  List province = [];
  TextEditingController restController = TextEditingController();
  // TextEditingController set1 = TextEditingController(text: "10");
  String groupValue = "steps";
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child) {
      var hSize = MediaQuery.of(context).size.height;
      var wSize = MediaQuery.of(context).size.width;
      List work = [];
      var p;
      gym.daywork.forEach((element) {
        if(element["title"]==widget.task){
          p = element;
        }
      });
      var image;
      var tit;


      workout.forEach((element) {
        work.add(element['title']);
      });




      return WillPopScope(
        onWillPop: () async{
          widget.notifyParent();

          return true;
        },
        child: Scaffold(
            key: _scaffoldKey,
          appBar: AppBar(
            title: Text(widget.title),
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: IconButton(
                      onPressed: () {
                      showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return MyDialog(work:work,workout:workout,title:widget.title,task:widget.task,notifyParent: refresh);
                      });
                      },
                      icon: Icon(
                        Icons.add,
                        size: 30,
                      ))),
            ],
          ),
          body: p[widget.title].isNotEmpty?
          Container(
            height: hSize * 0.55,
            child: ListView.builder(
                itemCount: p[widget.title].length,
                itemBuilder: (context, index) {
                  workout.forEach((element) {
                    if(element['title']==p[widget.title][index]["title"]){
                      element["subtitle"].forEach((activity){
                        if(activity["title"]==p[widget.title][index]["subtitle"]){
                          image = activity["image"];
                        }
                      });
                    }
                  });

                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      width: wSize * 0.8,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: hSize * 0.139,
                            width: wSize*0.22,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(15)),
                            // width: wSize * 0.50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              child: Image(
                                image: AssetImage(image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: hSize * 0.139,
                            width: wSize * 0.55,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Text(
                                    p[widget.title][index]["subtitle"],
                                    style: GoogleFonts.balooBhai(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                                Text(
                                  p[widget.title][index]["set"]+"-"+p[widget.title][index]["value"].join("-"),
                                  style: GoogleFonts.balooBhai(
                                    fontSize: 16,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0),

                                  child: Text(
                                    "Rest - "+p[widget.title][index]['rest'],
                                    style: GoogleFonts.balooBhai(
                                      fontSize: 15,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: wSize * 0.05),
                            child: IconButton(
                              iconSize: 25,
                              icon: Icon(MdiIcons.trashCan),
                              onPressed: () {
                                setState(() {
                                  p[widget.title].removeAt(index);

                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ):Center(child: Text("Add Some Plans"),),
        ),
      );
    });
  }
  

}

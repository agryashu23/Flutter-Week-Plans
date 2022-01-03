import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'WeekWorkout.dart';

class WeekDays extends StatefulWidget {
  const WeekDays({Key? key,required this.task}) : super(key: key);
  final String task;

  @override
  _WeekDaysState createState() => _WeekDaysState();
}

class _WeekDaysState extends State<WeekDays> {
  List days  =[
    {'title':"Monday",'image':"assets/icons/monday.jpg"},
    {'title':"Tuesday",'image':"assets/icons/tuesday.jpg"},
    {'title':"Wednesday",'image':"assets/icons/wednesday.jpg"},
    {'title':"Thursday",'image':"assets/icons/thursday.jpg"},
    {'title':"Friday",'image':"assets/icons/friday.jpg"},
    {'title':"Saturday",'image':"assets/icons/saturday.jpg"},
    {'title':"Sunday",'image':"assets/icons/sunday.jpg"},
  ];
  refresh() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child)
    {
      var a;
      gym.daywork.forEach((element) {
        if(element["title"]==widget.task){
          a = element;
        }
      });

      var hSize = MediaQuery

          .of(context)
          .size
          .height;
      var wSize = MediaQuery
          .of(context)
          .size
          .width;
      return Scaffold(
        backgroundColor: Colors.blue.shade100,
        body: Container(
          margin: EdgeInsets.only(top: 5),
          child: ListView.builder(
              itemCount: days.length,
              itemBuilder: (context, index) {

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>WeekWorkout(title:days[index]['title'],task:widget.task,
                            notifyParent: refresh)));
                    print(a);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    width: wSize * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Image(
                            height: 60,
                              width: 50,
                            image: AssetImage(days[index]["image"]),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                            width: wSize * 0.5,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5,left: 20),
                              child: Text(
                                days[index]['title'],
                                style: GoogleFonts.balooBhai(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                            Container(
                              width: wSize * 0.5,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child:Text(
                                  "|"+a[days[index]['title'].toString()].length.toString()+"exercises",
                                  style: GoogleFonts.balooBhai(
                                    fontSize: 20,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                  ],
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(left: wSize * 0.1),
                          child: IconButton(
                            iconSize: 30,
                            icon: Icon(Icons.more_vert),
                            onPressed: () {
                              setState(() {

                              });
                            }
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })
        ),
      );
    });
  }

}

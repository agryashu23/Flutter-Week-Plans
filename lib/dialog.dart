import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/Plans.dart';
import 'package:gym/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key,required this.work,required this.workout,required this.title,required this.task, required this.notifyParent}) : super(key: key);
  final List work;
  final List workout;
  final String title;
  final String task;
  final Function notifyParent;
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  bool text = false;
  String? selected;
  String? selectedC;

  List province = [];
  TextEditingController restController = TextEditingController();
  TextEditingController set1 = TextEditingController(text: "10");
  TextEditingController time1 = TextEditingController(text: "30");
  String groupValue = "steps";
  List _cardList = [];
  List _timeList = [];
  List controlValue = [];
  int j = 1;
  int s = 1;
  bool heigh = false;
  bool heig = false;
  String g ='';

  addDynamic({required int k, required FormModel gym}) {
    _cardList.add({"j":k,"widget":_card(k,gym)});
    setState(() {
    });
  }
  dynamicAdd({required int k, required FormModel gym}) {
    _timeList.add({"s":k,"widget":_card(k,gym)});
    setState(() {
    });
  }
  refresh() {
    setState(() {});
  }

  List<TextEditingController> controllers =[];
  List<TextEditingController> tcontrollers =[];
  var image;




  Widget _card(int k,gym){
    var tex;
    var hex;
    if(_cardList.length ==3){
      setState(() {
        heigh = true;
      });
    }
    // for(int l=1;l<_cardList.length;l++){
    //   control.add(controller.text.toString());
    // }
    if(_timeList.length ==3){
      setState(() {
        heig = true;
      });
    }
    if(groupValue=="steps"){
      for(int i= 2;i<=_cardList.length+2;i++){
        tex = i;
      }
    }
    if(groupValue=="time"){
      for(int i= 2;i<=_timeList.length+2;i++){
        hex = i;
      }
    }
    return Card(

      margin: EdgeInsets.symmetric(vertical: 4,horizontal: 9),
      color: Colors.grey.shade300,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  if(groupValue=="steps"){
                    if(tex == _cardList.length+1){
                      setState(() {
                        _cardList.removeWhere((element) => element["j"] == k);
                        heigh =false;
                        refresh();
                      });
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Delete Last Set First')));
                    }
                  }
                  else{
                    if(hex == _timeList.length+1){
                      setState(() {
                        _timeList.removeWhere((element) => element["s"] == k);
                        heig = false;
                        refresh();
                      });
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Delete Last Set First')));
                    }
                  }
                },
                icon: Icon(MdiIcons.trashCan,color: Colors.black54,size: 26,),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 1,right: 40),
                child: Text(
                  groupValue=="steps"?
                  "Set"+tex.toString():"Set"+hex.toString()
                  // groupValue=="steps"?"Set"+(_cardList.length+2).toString():"Set"+s.toString()
                  ,style: TextStyle(fontSize: 16),
                )
            ),
            Container(
                margin: EdgeInsets.only(right: 3),
                child: IconButton(
                  icon:Icon(MdiIcons.minusCircleOutline,color: Colors.blue,size: 30,),
                  onPressed: (){
                    FocusScope.of(context).unfocus();
                    if(groupValue == 'steps'){
                      if( int.parse(controllers[tex-2].text)>1){
                        setState(() {
                          controllers[tex-2].text = (int.parse(controllers[tex-2].text)-1).toString();
                        });
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Minimum No. of Reps should be 1')));
                      }
                    }
                    else{
                      if( int.parse(tcontrollers[hex-2].text)>10){
                        setState(() {
                          tcontrollers[hex-2].text = (int.parse(tcontrollers[hex-2].text)-10).toString();
                        });
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Minimum No. of Seconds should be 10')));
                      }
                    }

                  },
                )
            ),

            Container(
                width: 40,
                child: TextField(
                  controller: groupValue=="steps"?controllers[tex-2]:tcontrollers[hex-2],
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      counterText: "",
                      isDense: true,
                      contentPadding: EdgeInsets.all(6)
                  ),
                  onChanged: (value){
                    setState(() {
                    });
                  },

                )
            ),
            Container(
                margin: EdgeInsets.only(left: 1),
                child: IconButton(
                  icon:Icon(MdiIcons.plusCircleOutline,color: Colors.blue,size: 30,),
                  onPressed: (){
                    FocusScope.of(context).unfocus();
                    if(groupValue == 'steps'){
                      if( int.parse(controllers[tex-2].text)<99){
                        setState(() {
                          controllers[tex-2].text = (int.parse(controllers[tex-2].text)+1).toString();
                        });
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Maximum No. of Reps can be 99')));
                      }
                    }
                    else{
                      if( int.parse(tcontrollers[hex-2].text)<999){
                        setState(() {
                          tcontrollers[hex-2].text = (int.parse(tcontrollers[hex-2].text)+10).toString();
                        });
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Maximum No. of Reps can be 99')));
                      }
                    }
                  },
                )
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child)
    {
      if(groupValue=="steps"){
        if(controllers.isEmpty){
          controllers = List.generate(8, (i) => TextEditingController(text: "10"));
        }
      }
      if(groupValue=="time"){
        if(tcontrollers.isEmpty){
          tcontrollers = List.generate(8, (i) => TextEditingController(text: "30"));
        }
      }

      return SingleChildScrollView(
        child: AlertDialog(
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
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 8,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "WORKOUT DETAIL",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                value: selected,
                                isExpanded: true,
                                iconSize: 30,
                                hint:
                                Center(child: Text("Choose Body Part")),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.blue,
                                ),
                                items: widget.workout.map((e) {
                                  return DropdownMenuItem(
                                    value: e['title'],
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          height: 40,
                                          width: 40,
                                          // width: wSize * 0.50,
                                          child: ClipRRect(
                                            child: Image(
                                              image: AssetImage(e["image"]),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding:
                                          EdgeInsets.only(left: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  15)),
                                          alignment: Alignment.center,
                                          child: Text(
                                            e["title"],
                                            style: GoogleFonts.balooBhai(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  widget.workout.forEach((element) {
                                    if (element["title"] ==
                                        val.toString()) {
                                      if (province.isEmpty) {
                                        province = element['subtitle'];
                                      } else {
                                        setState(() {
                                          selectedC = null;
                                        });
                                        province = element['subtitle'];
                                      }
                                    }
                                  });
                                  setState(() {
                                    selected = val.toString();
                                  });
                                  print(selected);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                value: selectedC,
                                isExpanded: true,
                                iconSize: 30,
                                hint: Center(
                                  child: Text("Choose Workout"),
                                ),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.blue,
                                ),
                                items: province.map((e) {
                                  return DropdownMenuItem(
                                    value: e['title'],
                                    child: SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              // width: wSize * 0.50,
                                              child: ClipRRect(
                                                child: Image(
                                                  image: AssetImage(
                                                      e["image"]),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                              EdgeInsets.only(left: 15),
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      15)),
                                              alignment: Alignment.center,
                                              child: Text(
                                                e["title"],
                                                style:
                                                GoogleFonts.balooBhai(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight:
                                                  FontWeight.w300,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    selectedC = val.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white60,
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 8,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "PLAN DETAIL",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            iconSize: 25,
                            hint: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  widget.task.toUpperCase(),
                                  style: TextStyle(fontSize: 16),
                                )),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            items: null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              isExpanded: true,
                              iconSize: 25,
                              hint: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  widget.title.toUpperCase(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              items: null),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white60,
                padding: EdgeInsets.symmetric(
                    vertical: 5, horizontal: 7),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 8,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        margin: EdgeInsets.only(left: 20, bottom: 5),
                        child: Center(
                          child: Text(
                            "REST TIME",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Rest Time (s)", style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10, bottom: 5),
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.blue, width: 2),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: restController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "seconds",
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(6)
                              ),
                            ),
                          )
                        ],

                      )

                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white60,
                padding: EdgeInsets.symmetric(
                    vertical: 5, horizontal: 7),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 8,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 1),
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "Reps Unit",
                          style: TextStyle(
                              fontSize: 18,

                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if ("steps" != groupValue) {
                                groupValue = "steps";
                                setState(() {});
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: "steps",
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      groupValue = value.toString();
                                      setState(() {});
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Text(
                                      "Steps",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if ("time" != groupValue) {
                                groupValue = "time";
                                setState(() {});
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: "time",
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      setState(() {
                                        groupValue = value.toString();
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Text(
                                      "Time (sec)",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 50),
                          child: Row(
                            children: [
                              Text(
                                "Sets",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 70),
                                child: Text(
                                  groupValue == "steps" ? "Reps" : "Time(s)",
                                  style: TextStyle(
                                      fontSize: 18,

                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          )
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 6, horizontal: 9),
                        color: Colors.grey.shade300,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 50),
                                  width: 80,
                                  child: Text(
                                    "Set 1", style: TextStyle(fontSize: 16),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 3),
                                  child: IconButton(
                                    icon: Icon(MdiIcons.minusCircleOutline,
                                      color: Colors.blue, size: 30,),
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      if (groupValue == 'steps') {
                                        if (int.parse(set1.text) > 1) {
                                          setState(() {
                                            set1.text =
                                                (int.parse(set1.text) - 1)
                                                    .toString();
                                          });
                                        }
                                        else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Minimum No. of Reps should be 1')));
                                        }
                                      }
                                      else {
                                        if (int.parse(time1.text) > 10) {
                                          setState(() {
                                            time1.text =
                                                (int.parse(time1.text) - 10)
                                                    .toString();
                                          });
                                        }
                                        else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Minimum No. of Seconds should be 10')));
                                        }
                                      }
                                    },
                                  )
                              ),
                              Container(
                                  width: 40,
                                  child: TextField(
                                    controller: groupValue == "steps"
                                        ? set1
                                        : time1,
                                    maxLength: 2,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        counterText: "",
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(6)
                                    ),

                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 1),
                                  child: IconButton(
                                    icon: Icon(MdiIcons.plusCircleOutline,
                                      color: Colors.blue, size: 30,),
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();

                                      if (groupValue == 'steps') {
                                        if (int.parse(set1.text) < 99) {
                                          setState(() {
                                            set1.text =
                                                (int.parse(set1.text) + 1)
                                                    .toString();
                                          });
                                        }
                                        else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Maximum No. of Reps can be 99')));
                                        }
                                      }
                                      else {
                                        if (int.parse(time1.text) < 999) {
                                          setState(() {
                                            time1.text =
                                                (int.parse(time1.text) + 10)
                                                    .toString();
                                          });
                                        }
                                        else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Maximum No. of Reps can be 99')));
                                        }
                                      }
                                    },
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: groupValue == "steps" ? heigh ? 200 : _cardList
                            .length * 67 : heig ? 200 : _timeList.length * 67,
                        width: 400,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: groupValue == "steps"
                                ? _cardList.length
                                : _timeList.length,
                            itemBuilder: (context, index) {
                              return groupValue == "steps"
                                  ? _cardList[index]["widget"]
                                  : _timeList[index]["widget"];
                            }),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: TextButton(
                            onPressed: () {
                              if (groupValue == "steps") {
                                if (_cardList.length < 8) {
                                  setState(() {
                                    j = j + 1;
                                  });
                                  addDynamic(k: j,gym:gym);
                                }
                                else {
                                  Fluttertoast.showToast(
                                      msg: 'Maximum No. of sets can be 9 ',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.blue,
                                      textColor: Colors.white
                                  );
                                }
                              }
                              if (groupValue == "time") {
                                if (_timeList.length < 8) {
                                  setState(() {
                                    s = s + 1;
                                  });
                                  dynamicAdd(k: s,gym:gym);
                                }
                                else {
                                  Fluttertoast.showToast(
                                      msg: 'Maximum No. of sets can be 9 ',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.blue,
                                      textColor: Colors.white
                                  );
                                }
                              }
                            },
                            child: Text("ADD SETS", style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.66,
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(horizontal: 2),
              color: Colors.blue.shade400,
              child: TextButton(
                  child: Text(
                    'CREATE PLAN',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () async {
                    if(selected == null){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                          content: Text(
                              'Please Choose Body Part')));
                    }
                    if(selectedC ==null){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                          content: Text(
                              'Please Choose Workout')));
                    }
                    if(restController.text.isEmpty){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                          content: Text(
                              'Please Enter Rest Time')));
                    }

                    else{
                      setState(() {
                        if(groupValue=="steps"){
                          for(int i=0;i<_cardList.length;i++){
                            controlValue.add(controllers[i].text);
                          }
                          // gym.weekWork(selected,selectedC,restController.text,set1.text,controlValue);
                        }
                        if(groupValue=="time"){
                          for(int i=0;i<_timeList.length;i++){
                            controlValue.add(tcontrollers[i].text.toString()+"s");
                          }
                          // gym.weekWork(selected,selectedC,restController.text,time1.text,controlValue);

                        }
                        gym.daywork.forEach((element) {
                          if(element["title"] == widget.task){
                            setState(() {
                              element[widget.title].add({"title":selected,"subtitle":selectedC,
                                "rest":restController.text,"set":groupValue=='steps'?set1.text:time1.text+"s","value":controlValue});
                            });
                          }
                        });
                      });
                      widget.notifyParent();
                      Navigator.of(context).pop();
                      print(gym.daywork);
                    }
                  }),
            ),
          ],
        ),
      );
    });
  }
}



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/Actions/workout.dart';
import 'package:gym/Pages/FavPlans.dart';
import 'package:gym/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class WorkFav extends StatefulWidget {
  const WorkFav({Key? key}) : super(key: key);

  @override
  _WorkFavState createState() => _WorkFavState();
}

class _WorkFavState extends State<WorkFav> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child)
    {
      var hSize = MediaQuery
          .of(context)
          .size
          .height;
      var wSize = MediaQuery
          .of(context)
          .size
          .width;
      return Scaffold(
        appBar: AppBar(
          title: Text("My Plans"),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FavPlans())),
              child: Stack(
                children: [
                  Container(
                  width: wSize,
                height: hSize*0.23,
                margin: EdgeInsets.symmetric(horizontal: 3,vertical: 3),

                  child:  ShaderMask(
                    shaderCallback: (bounds) =>
                        LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black54, Colors.black87],
                        ).createShader(bounds),
                    blendMode: BlendMode.darken,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: AssetImage("assets/customize.jpg"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                ),
                  Container(
                    margin: EdgeInsets.only(left: wSize*0.38,top: hSize*0.12),
                    child: Text("CUSTOMIZE",style: TextStyle(fontSize: 30,color:
                    Colors.white,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: Colors.blue,decorationThickness: 2.0),),
                  )
                ],
              ),
            ),
         Container(
           margin: EdgeInsets.symmetric(vertical: 4),
             width: wSize,
           padding: EdgeInsets.all(5),
           color: Colors.lightBlueAccent,
           child: Text(
             "Favourites",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),
           ),
         ),
         Container(
           height: hSize*0.55,
           child: ListView.builder(
                itemCount: gym.work.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Workout(title: gym.work[index]['title'], image: gym.work[index]['image'],)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                      width: wSize*0.8,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: hSize * 0.1,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54),
                              borderRadius: BorderRadius.circular(15)

                            ),
                            // width: wSize * 0.50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                              child: Image(
                                image:AssetImage(
                                    gym.work[index]['image'],
                                ),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Container(
                            height: hSize * 0.1,
                            width: wSize * 0.5,
                            padding: EdgeInsets.only(left: wSize*0.06),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            alignment: Alignment.center,
                            child: Text(
                             gym.work[index]['title'],style: GoogleFonts.balooBhai(
                              fontSize: 18,color: Colors.white70,fontWeight: FontWeight.bold,
                            ),textAlign: TextAlign.center,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: wSize*0.1),
                            child: IconButton(
                              iconSize: 25,
                              icon: Icon(MdiIcons.trashCan),
                              onPressed: (){
                                setState(() {
                                  gym.work.removeWhere((element) =>
                                  element['title']==gym.work[index]['title']);
                                });
                              },
                            ),
                          )
                        ],
                      ),

                    ),

                  );
                }),
         ),
        ],
        ),
      );
    });
  }
}

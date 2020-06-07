import 'dart:async';

import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:zindy/fonction/firebaseHelper.dart';
import 'package:zindy/model/Article.dart';

class venteFlashController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeVenteFlash();
  }

}


class homeVenteFlash extends State<venteFlashController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: bodyPage(),
    );
  }



  Widget listEssai()
  {
    return Container(
      height: MediaQuery.of(context).size.height/3,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: false,
          itemBuilder: (BuildContext context,int index){
            return new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset("assets/logozindy.PNG",width: 200,height: 200,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Descriptio article'),
                    Padding(padding: EdgeInsets.all(10)),
                    Container(
                      height:MediaQuery.of(context).size.height/50,
                      width: MediaQuery.of(context).size.width/3,
                      child: FAProgressBar(
                        currentValue: 1700,

                        direction: Axis.horizontal,

                        maxValue: 3000,
                        animatedDuration: Duration(seconds: 10),
                        backgroundColor: Colors.orangeAccent,
                      ),

                    ),
                    Text("56 CFa",style: TextStyle(color: Colors.red),),
                    Text("120 000 CFa",style: TextStyle(decoration: TextDecoration.lineThrough),),
                    RaisedButton(
                      child: Text('Acheter',style: TextStyle(color: Colors.white),),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Colors.orangeAccent,
                      onPressed: (){
                        print('acheter');
                      },

                    ),
                  ],

                ),

              ],
            );

          }
      ),
    );
  }


  Widget listFinal()
  {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: FirebaseAnimatedList(
          query: firebaseHelper().base_article,
          itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation<double>animation,int index){
            Article listArticle = Article(snapshot);
            return ListTile(
              trailing: null,
              title:Text(listArticle.image),

            );

          }
      ),


    );
  }

Widget bodyPage()
{
  DateTime actuelle= DateTime.now();
  DateTime finPromo=DateTime(2020,07,25,15,30,00);
  int differenceH = finPromo.difference(actuelle).inSeconds;

  return Container(
    padding: EdgeInsets.all(20),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/logozindy.PNG'),
          Container(

            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Offre Eclair'),
                    CountdownFormatted(
                      duration: Duration(seconds: differenceH),
                      builder: (BuildContext context,String remain){
                        return Text("temps restant : $remain");
                      },

                    )
                  ],

                ),
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height:MediaQuery.of(context).size.height/8,
                          width: MediaQuery.of(context).size.width/3,
                          child: Card(
                              elevation: 10.0,
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text('Image article'),

                                ],
                              )
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10),),
                        Text('20 cfa',style: TextStyle(color: Colors.greenAccent),),
                        Text('10 Cfa',style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),),
                          Container(
                            height:MediaQuery.of(context).size.height/50,
                            width: MediaQuery.of(context).size.width/3,
                            child: FAProgressBar(
                              currentValue: 2500,

                              direction: Axis.horizontal,

                              maxValue: 3000,
                              animatedDuration: Duration(seconds: 10),
                              backgroundColor: Colors.orangeAccent,
                            ),

                          ),






                      ],

                    ),







                  ],

                ),




              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10),),
          listFinal()

        ],
      ),
    ),
  );
}
}
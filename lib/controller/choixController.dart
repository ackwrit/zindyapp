

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:zindy/controller/mainAppController.dart';
import 'package:zindy/controller/mainController.dart';

class choixController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeChoix();
  }

}

class homeChoix extends State<choixController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return (Platform.isIOS)?tabScaffIos():tabScaffAndroid();





  }



  List<Widget> controller()
  {
    return[
      mainController(),
      mainAppController(),
      mainAppController(),

    ];
  }


  Widget tabScaffIos(){
    return new CupertinoTabScaffold(
        tabBar: new CupertinoTabBar(
            backgroundColor: Colors.grey[50],
            activeColor: Colors.orange[400],
            inactiveColor: Colors.black,
            items: [
              new BottomNavigationBarItem(icon: new Icon(Icons.format_list_bulleted,),title: new Text("Catégorie",style: new TextStyle(fontSize: 18),)),
              new BottomNavigationBarItem(icon: new Icon(Icons.person),title:new Text('Compte',style: new TextStyle(fontSize: 18),)),
              new BottomNavigationBarItem(icon: new Icon(Icons.info_outline),title:new Text("Aide",style: new TextStyle(fontSize: 18),)),

            ]
        ),
        tabBuilder: (BuildContext context, int index) {
          Widget controllerSelected = controller()[index];
          return Scaffold(
              appBar: AppBar(
                //title:Image.asset('assets/logozindy.PNG'),
                title:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Rechercher',
                          prefixIcon: Icon(Icons.search),

                        ),

                      ),
                    ),

                    IconButton(icon: Icon(Icons.shopping_basket,size: 30,), onPressed: null)

                  ],
                ),


                backgroundColor: Colors.grey[500],



              ),
              body: controllerSelected
          );
        }
    );;

  }


  Widget tabScaffAndroid(){
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.blue,
          title: Text('Nymbeul'),
          centerTitle: true,
          actions: <Widget>[
            new IconButton(icon:Icon(Icons.account_circle,size: 32.0,color: Colors.white,), onPressed:null),

          ],
          bottom: new TabBar(
              tabs: [
                new Tab(icon: new Icon(Icons.format_list_bulleted,),child: new Text("Catégorie",style: new TextStyle(fontSize: 18),)),
                new Tab(icon: new Icon(Icons.person),child:new Text('Compte',style: new TextStyle(fontSize: 18),)),
                new Tab(icon: new Icon(Icons.info_outline),child:new Text("Aide",style: new TextStyle(fontSize: 18),)),






              ]),
        ),
        body: new TabBarView(
          children: controller(),
        ),
      ),

    );
  }





}
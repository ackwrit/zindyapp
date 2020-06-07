import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zindy/fonction/firebaseHelper.dart';
import 'package:zindy/model/Article.dart';

class listerArticle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeListe();
  }

}

class homeListe extends State<listerArticle>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }





  Widget bodyPage(){
    return Container(
      padding: EdgeInsets.only(top:120),
      child: FirebaseAnimatedList(
          query: firebaseHelper().base_article,
          itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation<double>animation,int index){
            Article listArticle = Article(snapshot);
            return ListTile(
              leading: Text(listArticle.nom),
            );
          }
      ),
    );
  }

}
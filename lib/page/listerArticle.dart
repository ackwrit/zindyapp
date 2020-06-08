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
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top:120),
      child: FirebaseAnimatedList(
        scrollDirection: Axis.vertical,
          shrinkWrap: true,
          query: firebaseHelper().base_article,
          itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation<double>animation,int index){
            Article listArticle = Article(snapshot);
            print(listArticle.nom);
            if(listArticle.nom==null)
              {
                return Container();
              }
            else {
              return Card(
                elevation: 10.0,
                child: ListTile(
                  leading: Text(listArticle.nom),
                  trailing: IconButton(
                      icon: Icon(Icons.delete), onPressed: null),

                ),
              );
            }
          }
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:zindy/fonction/firebaseHelper.dart';

class ajouterArticle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeAjouterArticle();
  }

}

class homeAjouterArticle extends State<ajouterArticle>{
  String articleNom;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }





  Widget bodyPage(){
    return Container(
      padding: EdgeInsets.only(top:120,left: 20,right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Entrer le nom de l'article"
            ),
            onChanged: (text){
              setState(() {
                articleNom =text;
              });
            },
          ),
          Padding(padding: EdgeInsets.all(10)),
          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              onPressed: (){
              validation();
              },
            child: Text("Enregistrer"),
          )

        ],
      ),
    );
  }



  validation(){
    String id="fjfnrjkfntekj";
   Map map ={
     "uid":id,
     "nom":articleNom,
   };
   firebaseHelper().addArticle(id, map);



  }

}
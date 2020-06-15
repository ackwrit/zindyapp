import 'dart:io';
import 'dart:math';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:zindy/controller/administrationController.dart';
import 'package:zindy/fonction/firebaseHelper.dart';
import 'package:zindy/model/Article.dart';

class ajouterArticle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeAjouterArticle();
  }

}

class homeAjouterArticle extends State<ajouterArticle>{
  String articleNom;
  String articleDesc;
  var articlePrix;
  var articleQuantite;
  String imageArticle='';
  Article article;
  String identifiantArticle = randomAlphaNumeric(40);
  String dropdownValue = 'High-Tech';
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(imageArticle);
    return bodyPage();
  }





  Widget bodyPage(){
    return Container(
      padding: EdgeInsets.only(top:120,left: 20,right: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              textAlign: TextAlign.center,
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
            Padding(padding: EdgeInsets.all(10),),
            TextField(
              textAlign: TextAlign.center,

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Entrer la description de l'article",
              ),

              onChanged: (text){
                setState(() {
                  articleDesc =text;

                });
              },
              maxLines:4,
            ),
            Padding(padding: EdgeInsets.all(10),),
            Container(
              padding: EdgeInsets.only(left:80,right: 80),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Entrer le prix de l'article"
                ),
                onChanged: (text){
                  setState(() {
                    articlePrix =text;

                  });
                },


              ),
            ),

            Padding(padding: EdgeInsets.all(10),),
            Container(
              padding: EdgeInsets.only(left:80,right: 80),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Entrer la quantité de l'article"
                ),
                onChanged: (text){
                  setState(() {
                    articleQuantite =text;

                  });
                },


              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            FlatButton(
                onPressed: (){
                  takePicture(ImageSource.gallery);

                },
                child: Text('Insérer une image')
            ),

            Padding(padding: EdgeInsets.all(10)),
            DropdownButton(
              value: dropdownValue,
                items: <String>['High-Tech', 'Maroquinerie', 'Nourriture', 'Beauté']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String newValue){
                  setState(() {
                    dropdownValue = newValue;
                  });
                }
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              onPressed: (){
                validation();
              },
              child: Text("Enregistrer"),
            )

          ],
        ),
      ),

    );
  }



  validation(){
    String id=identifiantArticle;
   Map map ={
     "uid":id,
     "nom":articleNom,
     'prix':articlePrix,
     'quantite':articleQuantite,
     'image':imageArticle,
     'desc':articleDesc,
     'flash':''
   };
   firebaseHelper().addArticle(id, map);
   Navigator.push(context, MaterialPageRoute(
     builder: (BuildContext context)
         {
           return administrationController();
         }
   ));



  }

  Future <void> takePicture(ImageSource source) async {
    //File fileimage = await ImagePicker.pickImage(source: source);
    File file = await FilePicker.getFile(
      type: FileType.image

    );
    firebaseHelper().savePicture(file, firebaseHelper().storage_article.child(identifiantArticle)).then(
            (string)
        {

          setState(() {
            imageArticle = string;
          });
          print(imageArticle);


        }
          );



  }

}
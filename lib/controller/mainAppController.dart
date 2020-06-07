import 'package:flutter/material.dart';
import 'package:zindy/controller/administrationController.dart';
import 'package:zindy/controller/choixController.dart';

class mainAppController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeMain();
  }

}

class homeMain extends State<mainAppController>{
  String identifiant;
  String password;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();

  }

  Widget bodyPage(){
    return Container(
      padding: EdgeInsets.all(50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Padding(padding: EdgeInsets.all(60)),
            new Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:Colors.orange[50],
              ),
              height: MediaQuery.of(context).size.height/2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Connexion'),
                  Padding(padding: EdgeInsets.all(10)),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'N° de téléphone',
                      fillColor: Colors.white,
                      filled: true,

                    ),
                    onChanged: (value){
                      setState(() {
                        identifiant = value ;
                      });
                    },


                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Entrer votre mot de passe',
                      fillColor: Colors.white,
                      filled: true,

                    ),
                    onChanged: (value){
                      setState(() {
                        identifiant = value ;
                      });
                    },


                  ),
                  FlatButton(onPressed: null, child: Text('Inscription')),
                  FlatButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context){
                        return administrationController();
                      }
                    ));

                  },
                      child: Text('Connexion')),
                ],
              ),





            ),
          ],
        ),
      ),
    );
  }

}
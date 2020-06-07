


import 'package:firebase_database/firebase_database.dart';

class User
{
  String id;
  String prenom;
  String nom;
  String login;
  String typeUtilisateur;
  String imageUrl;
  String mail;

  User(DataSnapshot snapshot){
    id=snapshot.key;
    Map map = snapshot.value;
    prenom = map["prenom"];
    nom = map["nom"];
    login = map["login"];
    typeUtilisateur = map["utilisateur"];
    imageUrl = map["imageUrl"];
    mail = map["mail"];


  }

  Map toMap(){
    return {
      "prenom":prenom,
      "nom":nom,
      "login":login,
      "utilisateur":typeUtilisateur,
      "nom":nom,
      "imageUrl":imageUrl,
      "uid":id,
      "mail":mail


    };
  }

}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zindy/model/Article.dart';
import 'package:zindy/model/User.dart';




class firebaseHelper{
  final auth=FirebaseAuth.instance;

  Future <FirebaseUser> handleSign(String mail,String password) async
  {
    final AuthResult userAuth = await auth.signInWithEmailAndPassword(email: mail, password: password);
    FirebaseUser user=userAuth.user;
    return user;
  }



  Future <FirebaseUser> handleCreate(String mail,String password,String prenom, String nom,String login,String typeUtilisateur) async
  {
    final AuthResult userAuth = await auth.createUserWithEmailAndPassword(email: mail, password: password);
    FirebaseUser user = userAuth.user;
    String uid=user.uid;
    Map map =
    {
      "uid":uid,
      "prenom":prenom,
      "nom":nom,
      "login":login,
      "utilisateur":typeUtilisateur,
      "nom":nom,
      "imageUrl":'',
      "mail":mail



    };
    addUser(uid, map);
    return user;


  }





  //Database

  static final base=FirebaseDatabase.instance.reference();
  final base_article=base.child("article");
  final base_user=base.child("user");





  addArticle(String uid,Map map)
  {
    base_article.child(uid).set(map);
  }


  Future<Article> getArticle(String uid) async
  {
    DataSnapshot snapshot = await base_article.child(uid).once();
    return Article(snapshot);
  }






  addUser(String uid,Map map)
  {
    base_user.child(uid).set(map);
  }


  Future<User> getUser(String uid) async
  {
    DataSnapshot snapshot = await base_article.child(uid).once();
    return User(snapshot);
  }

}
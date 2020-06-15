import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
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


  Future<bool> loginMobile(String phone, BuildContext context,TextEditingController codeController) async{
    auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          AuthResult result = await auth.signInWithCredential(credential);
         FirebaseUser user = result.user;

        },
        verificationFailed: (AuthException exception){
          print(exception);
        },
        codeSent: (String verificationId,[int forceResendingToken]){
          showDialog(
              context: context,
            barrierDismissible: false,
            builder: (context){
                return AlertDialog(
                  title: Text('Entrer le code'),
                  content: Column(
                    children: [
                      TextField(
                        controller: codeController,
                      ),
                    ],

                  ),
                  actions: [
                    FlatButton(
                        onPressed: () async {
                          final code = codeController.text.trim();
                          AuthCredential credential =PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);
                          AuthResult result = await auth.signInWithCredential(credential);
                          FirebaseUser user =result.user;
                        },
                        child: Text('Confirmer'))
                  ],

                );
            }
          );
        },
        codeAutoRetrievalTimeout: null
    );
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



  //storage
  static final base_storage = FirebaseStorage.instance.ref();
  final StorageReference storage_article = base_storage.child("article");

  Future <String> savePicture(File file,StorageReference storageReference) async{
    StorageUploadTask storageUploadTask = storageReference.putFile(file);
    StorageTaskSnapshot snapshot = await storageUploadTask.onComplete;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }

}
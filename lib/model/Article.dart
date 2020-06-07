import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Article{
  String id;
  String nom;
  String prix;
  String quantite;
  String image;
  String desc;
  String flash;



Article(DataSnapshot snapshot)
{
  id = snapshot.key;
  Map map = snapshot.value;
  nom =map ['nom'];
  prix = map['prix'];
  quantite = map['quantite'];
  image = map ['image'];
  desc = map['desc'];
  flash =map ['flash'];
}

Map toMap(){
  return {
    'uid':id,
    'nom':nom,
    'prix':prix,
    'quantite':quantite,
    'image':image,
    'desc':desc,
    'flash':flash

  };
}
}


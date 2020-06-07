import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zindy/controller/venteFlashController.dart';

class mainController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeMainC();
  }

}

class homeMainC extends State<mainController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }



  Widget bodyPage(){
    return new Container(
      color: Colors.grey[50],
      padding: EdgeInsets.only(top:110,left: 20,right: 20),
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
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

                IconButton(icon: Icon(Icons.shopping_cart,size: 30,), onPressed: null)
                
              ],
            ),

            
            Padding(padding: EdgeInsets.all(10)),
            CarouselSlider.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context,int index){
                  return new Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Colors.grey[50],
                      child: new Container(
                        width: 300,
                        child: Text('Article ${index}'),
                      )
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  height: 150,
                  scrollDirection: Axis.horizontal,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 500),
                )
            ),
            Padding(padding: EdgeInsets.all(10)),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height/3.5,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 2,right: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton.extended(
                          onPressed: (){

                          },
                          label: Text('Nos boutiques'),
                          icon: Icon(Icons.shopping_basket),
                          backgroundColor: Colors.pink,

                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        FloatingActionButton.extended(
                          onPressed: (){

                          },
                          label: Text("Supermarché"),
                          icon: Icon(Icons.shopping_cart),
                          backgroundColor: Colors.greenAccent,


                        ),

                      ],

                    ),
                    Padding(padding: EdgeInsets.all(20),),
                    //deuxième ligne conainer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton.extended(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context){
                                  return venteFlashController();
                                }
                            ));

                          },
                          label: Text("Vente Flash"),
                          icon: Icon(Icons.monetization_on),
                          backgroundColor: Colors.orange[400],


                        ),
                        Padding(padding: EdgeInsets.all(10),),
                        FloatingActionButton.extended(
                          onPressed: (){
                            print('Pharmacie');

                          },
                          label: Text("Pharmacie"),
                          icon: Icon(Icons.local_hospital),
                          backgroundColor: Colors.purple[400],


                        ),

                      ],
                    ),




                  ],
                ),

              ),
            ),
            //Collections d'objects
            Padding(padding: EdgeInsets.all(5)),
            Text('Collection'),


            //liste des articles





          ],
        ),
      ),
    );
  }

}
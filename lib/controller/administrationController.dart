import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zindy/controller/choixController.dart';
import 'package:zindy/controller/mainAppController.dart';
import 'package:zindy/page/ajouterArticle.dart';
import 'package:zindy/page/listerArticle.dart';


class administrationController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homePanel();
  }

}

class homePanel extends State<administrationController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(Theme.of(context).platform==TargetPlatform.iOS)
    {
      return new CupertinoTabScaffold(
          tabBar: new CupertinoTabBar(
              backgroundColor: Colors.grey[50],
              activeColor: Colors.orange[400],
              inactiveColor: Colors.black,
              items:[
                new BottomNavigationBarItem(icon: new Icon(Icons.view_list),title: new Text("Liste article",style: TextStyle(fontSize: 18),)),
                new BottomNavigationBarItem(icon: new Icon(Icons.add_circle),title: new Text('Ajouter',style: TextStyle(fontSize: 18),)),








              ]),
          tabBuilder: (BuildContext context,int index){
            Widget controllerSelected= controllers()[index];
            return new Scaffold(
              appBar: new AppBar(
                title: Image.asset('assets/logozindy.PNG'),
                actions: [
                  IconButton(icon:Icon(Icons.account_circle,color: Colors.black,), onPressed:()
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return choixController();
                        }
                    ));

                  }
                  )
                ],
                elevation: 0.0,



                backgroundColor: Colors.transparent),
              extendBodyBehindAppBar: true,
              body: controllerSelected,


            );
          }
      );
    }
    else
    {
      return new DefaultTabController(
        length: 5,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.blue[100],
            title: Text('Takehair'),
            centerTitle: true,
            actions: <Widget>[
              new IconButton(icon:Icon(Icons.account_circle,size: 32.0,color: Colors.white,), onPressed:null),

            ],
            bottom: new TabBar(
                tabs: [
                  new Tab(icon: new Icon(Icons.comment),),
                  new Tab(icon: new Icon(Icons.directions_bus),),
                  new Tab(icon: new Icon(Icons.account_balance),),

                  new Tab(icon: new Icon(Icons.local_hospital),),
                  new Tab(icon: new Icon(Icons.beach_access),),




                ]),
          ),
          body: new TabBarView(
            children: controllers(),
          ),
        ),

      );
    }



  }



  List <Widget> controllers (){
    return [
      listerArticle(),
      ajouterArticle(),










    ];

  }

}
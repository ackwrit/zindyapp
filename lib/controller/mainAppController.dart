import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:zindy/controller/administrationController.dart';
import 'package:zindy/controller/choixController.dart';
import 'package:zindy/fonction/firebaseHelper.dart';

class mainAppController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeMain();
  }

}

class homeMain extends State<mainAppController>{
  String phoneNumber;
  TextEditingController codeController;
  String smsCode;
  String verificationCode;

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
                InternationalPhoneNumberInput(
                  onInputChanged: (number){
                    setState(() {
                      phoneNumber = number.phoneNumber;

                    });

                  },



                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  hintText: 'N° de téléphone',
                  inputDecoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),


                  FlatButton(onPressed: (){

                    loginMobile(phoneNumber, context);

                  },
                      child: Text('Inscription')),
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





  Future<bool> loginMobile(String phone, BuildContext context) async{
    final auth=FirebaseAuth.instance;
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










}
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
  String phone,verificationId;
  TextEditingController codeController;
  String smsCode;
  String verificationCode;
  bool codeSent =false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();

  }

  Widget bodyPage(){
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height/1.2,
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
                          phone = number.toString().trim();

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

                    Padding(padding: EdgeInsets.all(20)),
                    codeSent?TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Entrer le code'
                      ),
                      onChanged: (val)
                      {
                        setState(() {
                          smsCode=val;
                        });
                      },

                    ):Container(),


                    FlatButton(onPressed: (){


                      codeSent?signOTP(smsCode,verificationId):loginMobile(phone);

                    },
                        child: codeSent?Text('Inscription'):Text('Validation')
                    ),
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
      )
    );

  }





  Future<void> loginMobile(String phone) async{


    final PhoneVerificationCompleted verified = (AuthCredential authResult){
      FirebaseAuth.instance.signInWithCredential(authResult);
      

    };

    final PhoneVerificationFailed verificationFailed = (AuthException authException){
      print('${authException}');

    };

    final PhoneCodeSent smsSent =(String verId,[int forceResend]){
      this.verificationId =verId;
      setState(() {
        this.codeSent =true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout =(String verId){
      this.verificationId = verId;
    };

    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 30),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout
    );




  }




 signOTP(smsCode,verifId){
    AuthCredential authCredential=PhoneAuthProvider.getCredential(
        verificationId: verifId,
        smsCode: smsCode);
    FirebaseAuth.instance.signInWithCredential(authCredential);

 }








}
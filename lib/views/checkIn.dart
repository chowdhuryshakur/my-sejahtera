import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Controllers/loginController.dart';
import 'package:simple_blog_app/views/layout.dart';

class CheckIn extends StatefulWidget {
  @override
  _CheckInState createState() => _CheckInState();
}
final LoginController loginController = Get.put(LoginController());

class _CheckInState extends State<CheckIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFECF0F1),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          // The containers in the background
          new Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .40,
                color: Color(0xFF3A83FF),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .50,
                color: Color(0xFFECF0F1),
              )
            ],
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .04,
                  right: 10.0,
                  left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Check-in',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right),
                  Row(
                    children: [
                      Icon(Icons.refresh, color: Colors.white, size: 18),
                      Text('Refresh Status',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.right),
                    ],
                  )
                ],
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .11,
                  right: 10.0,
                  left: 10.0),
              child: Column(
                children: [
                  Center(
                      child: Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        color: Color(0xff3A83FF),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('img/check-in.jpg'))),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(loginController.user.value.patientName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right),
                  SizedBox(
                    height: 3,
                  ),
                  Text(loginController.user.value.passport,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.right),
                ],
              )),
          Container(
              alignment: Alignment.topCenter,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .41,
                  right: 0.0,
                  left: 0.0),
              child: Column(children: [
                Container(
                  height: 90.0,
                  width: MediaQuery.of(context).size.width-10,
                  child: new Card(
                    color: Color(0xff62B4EC),
                    elevation: 1.0,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.emoji_transportation_sharp, size:25, color: Colors.white,),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text('COVID-19 Risk Status',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                              Text('Low Risk No Symptom',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                            ],)
                          ),
                          SizedBox(width: 5)
                        ]),
                  ),
                ),
                Container(
                  height: 90.0,
                  width: MediaQuery.of(context).size.width-10,
                  child: new Card(
                    color: Color(0xffFED775),
                    elevation: 1.0,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.medical_services_outlined, size:25, color: Colors.black,),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text('COVID-19 Vaccination Status',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),textAlign: TextAlign.left,),
                              Text('Fully Vaccinated',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),textAlign: TextAlign.left,),
                            ],)
                          ),
                          SizedBox(width: 5)
                        ]),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.17,),
                Container(color: Colors.white,
                child:TextButton(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFF3A83FF)),
                        height: 35,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                            child: Text('Check-in',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.center))),
                    onPressed: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Layout())))),
              ]))
        ])));
  }
}

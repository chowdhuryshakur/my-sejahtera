import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Controllers/loginController.dart';
import 'package:simple_blog_app/views/layout.dart';

class CheckInStart extends StatefulWidget {
  @override
  _CheckInStartState createState() => _CheckInStartState();
}

final LoginController loginController = Get.put(LoginController());

class _CheckInStartState extends State<CheckInStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFECF0F1),
        body: Container(
          height: MediaQuery.of(context).size.height*1,
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
                  Row(
                          children: [
                            ImageIcon(
                              AssetImage("img/check-in-refresh.png"),
                              color: Colors.white,
                              size: 18,
                            ),
                            Text(' Refresh Status',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                                textAlign: TextAlign.right),
                          ],
                        ),
                  TextButton(
                      child: Container(
                          height: 30,
                          width: 65,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 2, 0, 2),
                                child: Text('Close',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF3A83FF))),
                              ))),
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Layout())))
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
                          fontFamily: 'arial',
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
                  width: MediaQuery.of(context).size.width - 10,
                  child: new Card(
                    color: Color(0xff62B4EC),
                    elevation: 1.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('img/virus.png'),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('COVID-19 Risk Status',
                                      style: TextStyle(
                                          fontFamily: 'arial',
                                          fontSize: 14,
                                          color: Colors.white)),
                                  SizedBox(height: 5,),
                                  Text('Low Risk No Symptom',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'arial',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              )),
                          SizedBox(width: 5)
                        ]),
                  ),
                ),
                Container(
                  height: 90.0,
                  width: MediaQuery.of(context).size.width - 10,
                  child: new Card(
                    color: Color(0xffFED775),
                    elevation: 1.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('img/vaccin-icon.png'),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'COVID-19 Vaccination Status',
                                    style: TextStyle(
                                        fontFamily: 'arial',
                                        fontSize: 14,
                                        color: Colors.black),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Fully Vaccinated',
                                    style: TextStyle(
                                        fontFamily: 'arial',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              )),
                          SizedBox(width: 5)
                        ]),
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * .232,
                // ),
                Expanded(child: SizedBox()),
                Container(
                    height: 60,
                    color: Colors.white,
                    child: TextButton(
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
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Layout())))),
              ]))
        ])));
  }
}

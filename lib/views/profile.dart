import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Controllers/loginController.dart';
import 'package:simple_blog_app/Models/api.dart';
import 'package:simple_blog_app/views/settings.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}
final LoginController loginController = Get.put(LoginController());
class _ProfileState extends State<Profile> {
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
                height: MediaQuery.of(context).size.height * .30,
                color: Color(0xFF3A83FF),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .70,
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
                  Text('Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right),
                  IconButton(
                      icon: Icon(Icons.menu, color: Colors.white, size: 28),
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Settings()))),
                ],
              )),
          Container(
              alignment: Alignment.topCenter,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .11,
                  right: 5.0,
                  left: 5.0),
              child: Column(children: [
                Container(
                  height: 80.0,
                  width: MediaQuery.of(context).size.width,
                  child: new Card(
                    color: Colors.white,
                    elevation: 1.0,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 15),
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(Api().base+loginController.user.value.image),
                          ),
                          SizedBox(width: 15),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(loginController.user.value.patientName,
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text('Low Risk No Symptom',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black)),
                                ],
                              )),
                          SizedBox(width: 5)
                        ]),
                  ),
                ),
                Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  child: new Card(
                      color: Colors.white,
                      elevation: 1.0,
                      child: Column(
                        children: [
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 30, right: 15, left: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('MySJ ID',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.right),
                                  Text(loginController.user.value.mysjId,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right),
                                ],
                              )),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 30, right: 15, left: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('IC/Passport NO',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.right),
                                  Text(loginController.user.value.passport,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right),
                                ],
                              )),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 30, right: 15, left: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('State',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.right),
                                  Text(loginController.user.value.state,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right),
                                ],
                              ))
                        ],
                      )),
                ),
                Container(
                  height: 90.0,
                  width: MediaQuery.of(context).size.width,
                  child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    color: Colors.white,
                    elevation: 1.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.refresh, size: 30),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                              child: Text('Click to refresh your profile',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black))),
                          Container(
                              height: 35,
                              width: 75,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  color: Colors.grey[300],
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(6, 3, 0, 0),
                                    child: Text('Refresh',
                                        style: TextStyle(fontSize: 15)),
                                  )))
                        ]),
                  ),
                ),
                Container(
                  height: 557.0,
                  width: MediaQuery.of(context).size.width,
                  child: new Card(
                      color: Colors.white,
                      elevation: 1.0,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('As of 6 Sep 2021, 2:06 PM    ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.left)),
                          Container(
                            color: Color(0xff63B3ED),
                            height: 80,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15, right: 15, left: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Text('Status risico COVID-19',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                          textAlign: TextAlign.left),
                                      Text('COVID-19 risk status',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                          textAlign: TextAlign.left),
                                      Text('Risiko Rendah / Low Risk',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left),
                                    ]),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Container(
                                          height: 60.0,
                                          width: 60.0,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF63B3ED),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'img/malaysian-government-logo-11550724235mgo1sa74ci.png'))),
                                        ))
                                  ],
                                )),
                          ),
                          Center(
                              child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Container(
                                    height: 210.0,
                                    width: 210.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('img/qr.jpg'))),
                                  ))),
                          Row(children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 140,
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xffFF0000),
                                    width: 5.0,
                                  ),
                                  top: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  right: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Row(children: [
                                Padding(
                                padding: EdgeInsets.fromLTRB(8, 15, 0, 15),
                                child: Text('Current location risk:',
                                    style: TextStyle(fontSize: 7, color: Colors.grey)),
                              ),
                                Padding(
                                padding: EdgeInsets.fromLTRB(0, 15, 8, 15),
                                child: Text(' Red Zone',
                                    style: TextStyle(fontSize: 7, color: Colors.red)),
                              ),
                              ],)
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 140,
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color(0xffEE8937),
                                    width: 5.0,
                                  ),
                                  top: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  right: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                children:[
                                  Padding(
                                padding: EdgeInsets.fromLTRB(8, 15, 0, 15),
                                child: Text('Hight Risk Dependent:',
                                    style: TextStyle(fontSize: 7, color: Colors.grey)),
                              ),
                                  Padding(
                                padding: EdgeInsets.fromLTRB(0, 15, 8, 15),
                                child: Text(' Yes',
                                    style: TextStyle(fontSize: 7, color: Colors.yellow[800])),
                              ),
                                ]
                              )
                            ),
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Color(0xffF2F2F2),
                            height: 115,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15, right: 15, left: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        'This is the QR code for \nMy Sejahtera \nprofile. Please show this \nto authorities when \nrequested.',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.left),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 10, right: 5),
                                            child: Container(
                                              height: 46.0,
                                              width: 46.0,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFF2F2F2),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'img/s1.png'))),
                                            )),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Container(
                                              height: 46.0,
                                              width: 46.0,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFF2F2F2),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'img/s2.png'))),
                                            ))
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ],
                      )),
                ),
                Container(
                  height: 170.0,
                  width: MediaQuery.of(context).size.width,
                  child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xff70AD46),
                    elevation: 1.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 10, left: 0),
                                  child: Container(
                                      height: 40,
                                      width: 160,
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          color: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.all(6),
                                            child: Text('COVID-19 Negative',
                                                style: TextStyle(fontSize: 14, color: loginController.user.value.result=='Negative'?Colors.red:Colors.green)),
                                          )))),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
                                  child: Text('Confirmation date:'+loginController.user.value.confirmationDate.toString().split(' ')[0],
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white))),
                            ],
                          ),
                          Column(children: [
                            Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 0),
                                child: Container(
                                  height: 60.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF70AD46),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'img/malaysian-government-logo-11550724235mgo1sa74ci.png'))),
                                )),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text('RT-PCR',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white))),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 40, 5, 0),
                              child: Text('Source: MKAK, KKM',
                                  style: TextStyle(
                                      fontSize: 8, color: Colors.white)),
                            )
                          ])
                        ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(6, 61, 6, 6),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffFED775),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          )),
                      height: 660.0,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 50),
                              Text('COVID-19\nVaccination',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  textAlign: TextAlign.center),
                              Text('Digital Certificate',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black)),
                              Divider(
                                  thickness: 3,
                                  height: 30,
                                  indent: 15,
                                  endIndent: 15,
                                  color: Colors.black),
                              Text(loginController.user.value.patientName,
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  textAlign: TextAlign.center),
                              Text(loginController.user.value.passport,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black)),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  height: 160.0,
                                  width: MediaQuery.of(context).size.width,
                                  child: new Card(
                                      color: Color(0xffFEE7AC),
                                      elevation: 1.0,
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15, right: 10, left: 10),
                                              child: Column(
                                               crossAxisAlignment:
                                                   CrossAxisAlignment
                                                        .start,
                                                children: [
                                                  Text('Dose 1:',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.left),
                                                  SizedBox(height: 5),
                                                  Text(
                                                      'Date: '+loginController.user.value.doseOneDate.toString().split(' ')[0]+' '+loginController.user.value.doseOneTime+' Manufacturer: '+loginController.user.value.doseOneManufacturer+' Facility: World Trade Centre KualaLumpur (Station 2) Batch: '+loginController.user.value.doseOneBatch,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                      ),
                                                      textAlign:
                                                          TextAlign.left),
                                                ],
                                              )),
                                        ],
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                child: Container(
                                  height: 160.0,
                                  width: MediaQuery.of(context).size.width,
                                  child: new Card(
                                      color: Color(0xffFEE7AC),
                                      elevation: 1.0,
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15, right: 10, left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                children: [
                                                  Text('Dose 2:',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.left),
                                                  SizedBox(height: 5),
                                                  Text(
                                                       'Date: '+loginController.user.value.doseTwoDate.toString().split(' ')[0]+' '+loginController.user.value.doseTwoTime+' Manufacturer: '+loginController.user.value.doseTwoManufacturer+' Facility: World Trade Centre KualaLumpur (Station 2) Batch: '+loginController.user.value.doseTwoBatch,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                      ),
                                                      textAlign:
                                                          TextAlign.left),
                                                ],
                                              )),
                                        ],
                                      )),
                                ),
                              ),
                              Container(
                                  child: Center(
                                    child: Container(
                                      height: 80.0,
                                      width: 80.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'img/cher-foot.png'))),
                                    ),
                                  )),
                            ],
                          )
                        ],
                      )),
                ),
              ])),
          Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 1.742,
                  right: 10.0,
                  left: 10.0),
              child: Center(
                child: Container(
                  height: 100.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('img/cer-head.png'))),
                ),
              )),
        ])));
  }
}

//react package.json
// "browserslist": {
  //   "production": [
  //     ">0.2%",
  //     "not dead",
  //     "not op_mini all"
  //   ],
  //   "development": [
  //     "last 1 chrome version",
  //     "last 1 firefox version",
  //     "last 1 safari version"
  //   ]
  // },
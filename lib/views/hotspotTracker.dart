import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Controllers/loginController.dart';
import 'package:simple_blog_app/views/layout.dart';
import 'package:simple_blog_app/views/vaccination.dart';

final LoginController loginController = Get.put(LoginController());

class HotspotTracker extends StatefulWidget {
  @override
  _HotspotTrackerState createState() => _HotspotTrackerState();
}

class _HotspotTrackerState extends State<HotspotTracker> {
  @override
  Widget build(BuildContext context) {
    Widget profilePage = SingleChildScrollView(
      child: Column(children: [
        Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Card(
                child: Container(
                    height: 580,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text('Track COVID-19 Hotspot',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                              SizedBox(height: 30),
                              Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey[100],
                                          border: Border.all(
                                              color: Colors.grey[300])),
                                      child: SizedBox(
                                        height: 35.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .65,
                                        child: TextFormField(
                                          decoration: new InputDecoration(
                                            //fillColor: Colors.white,
                                            border: InputBorder.none,
                                            filled: true,
                                            prefixIcon: Icon(Icons.search),
                                            hintText: 'Search',
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xffE0E0E0))),
                                            contentPadding: EdgeInsets.only(
                                                bottom: 8.0,
                                                left: 10.0,
                                                right: 10.0),
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.location_pin),
                                  )
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                      'Use your current location or search a location to check for COVID-19 hotspot',
                                      style: TextStyle(color: Colors.grey))),
                              Center(
                      child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('img/locationPin.png'))),
                  )),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                      'Note: To view map, kindly udw search bo function to search for a location.',
                                      style: TextStyle(color: Colors.grey))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10, bottom:10),
                                  child: Text(
                                      'Result',
                                      style: TextStyle(color: Colors.grey))),
                              
                           Container( 
                            height: 110,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all()),                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 0, right: 0, left: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                     Padding(
                                            padding: EdgeInsets.only(
                                                left:10, bottom: 10, right: 5),
                                            child: Container(
                                              height: 46.0,
                                              width: 46.0,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFF2F2F2),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'img/greenTik.png'))),
                                            )),
                                    Container(width: MediaQuery.of(context).size.width*.6,
                                      height: 110,
                                      color: Colors.black,
                                      child:Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child:Text(
                                        'Hi '+loginController.user.value.patientName+', there have been no reported case(s) of COVID-19 within a 1km radius from your current location in the last 14 days',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.left),)
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(height: 15),
                              Container(width: MediaQuery.of(context).size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.green,
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
                                child: Text('This location is within the',
                                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                              ),
                                Padding(
                                padding: EdgeInsets.fromLTRB(0, 15, 8, 15),
                                child: Text(' Green Zone',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              ),
                              ],)
                            ),
                            ]))))),
        Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Card(
                child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                        child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                                'Reported case is based on the source & potential spread of COVID-19 afte detailed investigation by MOH',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold))))))),
      ]),
    );

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: Color(0xff3A83FF),
          centerTitle: true,
          title: Row(children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Layout()))),
            Text('  Hotspot Tracker',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ]),
        ),
        body: Container(
            color: Color(0xffECF0F1),
            child: Column(children: [
              Container(
                  height: MediaQuery.of(context).size.height * .81,
                  child: ListView(children: [profilePage])),
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 10),
                      TextButton(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 35,
                              width: 70,
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                                  child: Text('Done',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      textAlign: TextAlign.center))),
                          onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Layout())))
                    ],
                  )),
            ])));
  }
}

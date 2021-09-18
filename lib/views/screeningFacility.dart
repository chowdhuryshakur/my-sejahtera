import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Controllers/loginController.dart';
import 'package:simple_blog_app/views/layout.dart';
import 'package:simple_blog_app/views/vaccination.dart';

final LoginController loginController = Get.put(LoginController());

class ScreeningFacility extends StatefulWidget {
  @override
  _ScreeningFacilityState createState() => _ScreeningFacilityState();
}

class _ScreeningFacilityState extends State<ScreeningFacility> {
  @override
  Widget build(BuildContext context) {
     Widget profilePage = SingleChildScrollView(
      child: Column(children: [
        Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Card(
                child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                      'Locate Health Screening Facility',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                              
                            ]))))),
                            SizedBox(height: MediaQuery.of(context).size.height-455,),
                              Container(
                                width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:10
                        ),
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
            Text('  Screening Facility',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ]),
        ),
        body: Container(
            color: Color(0xffECF0F1), child: Column(children: [profilePage])));
  }
}

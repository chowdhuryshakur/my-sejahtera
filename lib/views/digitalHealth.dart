import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/views/home.dart';
import 'package:simple_blog_app/views/layout.dart';

class DigitalHealth extends StatefulWidget {
  @override
  _DigitalHealthState createState() => _DigitalHealthState();
}

class _DigitalHealthState extends State<DigitalHealth> {
  
  @override
  Widget build(BuildContext context) {
    List<ProfileItem> general = [
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 23.0,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("img/digital-health1.png"),
        ),
        itemName: 'Virtual Health Advisory',
        icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size:15)),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 23.0,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("img/digital-health2.png"),
        ),
        itemName: 'Clinic Appointment ',
        icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size:15)),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 23.0,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("img/digital-health3.png"),
        ),
        itemName: 'Minda Sihat',
        icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size:15)),
  ];

    Widget profilePage = SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(mainAxisSize: MainAxisSize.min, children: [
            Flexible(
                fit: FlexFit.loose,
                child: Padding(padding: EdgeInsets.all(5),
                child: Card(
                    child: Column(
                        children: general
                            .map((e) => Row(children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(9, 10, 10, 10),
                                      child: e.icon1),
                                  Container(
                                      height: 35.0,
                                      width: MediaQuery.of(context).size.width -
                                          90,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 7, 0, 5),
                                              child: Text(e.itemName,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black)),
                                            ),
                                            Expanded(child: SizedBox()),
                                            e.icon2,
                                            SizedBox(width: 5)
                                          ])),
                                ]))
                            .toList())))),
          ]),
        ],
      ),
    );

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: Color(0xff3A83FF),
          centerTitle: true,
          title: Row(children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white, size:30),
                onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Layout()))),
            Text('Digial Healthcare',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ]),
        ),
        body: Container(color:Color(0xffECF0F1),
          child: Column(
          children: [profilePage])));
  }
}

class ProfileItem {
  Widget icon1;
  String itemName;
  Widget icon2;

  ProfileItem({this.icon1, this.itemName, this.icon2});
}

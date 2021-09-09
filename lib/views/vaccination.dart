import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/views/home.dart';
import 'package:simple_blog_app/views/layout.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'about.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Controllers/loginController.dart';

class Vaccination extends StatefulWidget {
  @override
  _VaccinationState createState() => _VaccinationState();
}
final LoginController loginController = Get.put(LoginController());

class _VaccinationState extends State<Vaccination> {
  List<ProfileItem> general = [
    new ProfileItem(
        icon1: Icon(
          Icons.language_rounded,
          size: 25,
          color: Colors.red,
        ),
        itemName: 'Vaccine for \n '+ loginController.user.value.patientName,
        icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size:18)),
    new ProfileItem(
        icon1: Icon(
          Icons.person_pin,
          size: 25,
          color: Colors.red,
        ),
        itemName: 'Add Vaccube Dependent',
        icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size:18)),
    new ProfileItem(
        icon1: Icon(
          Icons.person_pin,
          size: 25,
          color: Colors.red,
        ),
        itemName: 'www.vaksincovid.gov.my',
        icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size:18)),
    new ProfileItem(
        icon1: Icon(
          Icons.person_pin,
          size: 25,
          color: Colors.red,
        ),
        itemName: 'COVID-19 Vaccine \n Information',
        icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size:18)),
  ];

  @override
  Widget build(BuildContext context) {
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
                                          EdgeInsets.fromLTRB(13, 10, 10, 10),
                                      child: e.icon1),
                                  Container(
                                      height: 60.0,
                                      width: MediaQuery.of(context).size.width -
                                          70,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 7, 0, 5),
                                              child: Text(e.itemName,
                                                  style: TextStyle(
                                                      fontSize: 18,
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
            Text('       Vaccination',
                style: TextStyle(
                    fontSize: 24,
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

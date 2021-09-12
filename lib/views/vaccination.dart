import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Models/api.dart';
import 'package:simple_blog_app/views/home.dart';
import 'package:simple_blog_app/views/layout.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'about.dart';
import 'package:simple_blog_app/Controllers/loginController.dart';

class Vaccination extends StatefulWidget {
  @override
  _VaccinationState createState() => _VaccinationState();
}

final LoginController loginController = Get.put(LoginController());

class _VaccinationState extends State<Vaccination> {
   _launchURLWeb() async {
    const url = 'https://www.vaksincovid.gov.my/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  
  @override
  Widget build(BuildContext context) {
   List<ProfileItem> general = [
    new ProfileItem(
      icon1: CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(Api().base + loginController.user.value.image),
        ),
      itemName: 'Vaccine for ' + loginController.user.value.patientName,
      icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15),
    ),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("img/vaccine1.png"),
        ),
        itemName: 'Add Vaccube Dependent',
        icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15)),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('img/vaccine2.png'),
        ),
        itemName: 'www.vaksincovid.gov.my',
        icon2: Container(
              padding: const EdgeInsets.all(0.0),
              width: 25.0, // you can adjust the width as you need
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15),
                 onPressed: () => _launchURLWeb())
              )),
       new ProfileItem(
        icon1: CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("img/vaccin3.png"),
        ),
        itemName: 'COVID-19 Vaccine Information',
        icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15)),
  ];

    Widget profilePage = SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(mainAxisSize: MainAxisSize.min, children: [
            Flexible(
                fit: FlexFit.loose,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                        child: Column(
                            children: general
                                .map((e) => Row(children: [
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              2, 10, 2, 10),
                                          child: e.icon1),
                                      Container(
                                          height: 60.0,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              80,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              110,
                                                  child:Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 7, 0, 5),
                                                  child: Text(e.itemName,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black)),
                                                ),),
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
                icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Layout()))),
            Text('       Vaccination',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ]),
        ),
        body: Container(
            color: Color(0xffECF0F1), child: Column(children: [profilePage])));
  }
}

class ProfileItem {
  Widget icon1;
  String itemName;
  Widget icon2;

  ProfileItem({this.icon1, this.itemName, this.icon2});
}

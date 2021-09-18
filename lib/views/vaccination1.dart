import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Controllers/loginController.dart';
import 'package:simple_blog_app/views/vaccination.dart';

final LoginController loginController = Get.put(LoginController());

class Vaccination1 extends StatefulWidget {
  @override
  _Vaccination1State createState() => _Vaccination1State();
}

class _Vaccination1State extends State<Vaccination1> {
  @override
  Widget build(BuildContext context) {
    Widget profilePage = SingleChildScrollView(
      child: Column(children: [
        Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Card(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text('Name',
                                      style: TextStyle(color: Colors.grey))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                      loginController.user.value.patientName,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text('IC / Passport No',
                                      style: TextStyle(color: Colors.grey))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                      loginController.user.value.passport,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))),
                              SizedBox(height:10),
                             Container(
                                height: MediaQuery.of(context).size.height*.54,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('img/vtrack.png'))),
                              )
                            ]))))),
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
                    MaterialPageRoute(builder: (context) => Vaccination()))),
            Text('       Vaccination',
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

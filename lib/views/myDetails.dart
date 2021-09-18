import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_blog_app/Controllers/loginController.dart';
import 'package:simple_blog_app/Models/api.dart';
import 'package:simple_blog_app/views/login.dart';
import 'package:simple_blog_app/views/settings.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';

class MyDetails extends StatefulWidget {
  @override
  _MyDetailsState createState() => _MyDetailsState();
}

bool checkedValue = false;
File _image;
final picker = ImagePicker();
final LoginController loginController = Get.put(LoginController());

class _MyDetailsState extends State<MyDetails> {
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[300]),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 6, 6, 6),
                                      child: CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.white,
                                        backgroundImage: _image == null
                                            ? NetworkImage(Api().base +
                                                loginController
                                                    .user.value.image)
                                            : FileImage(File(_image.path)),
                                      ),
                                    ),
                                    Container(
                                        height: 60.0,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                110,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 7, 0, 5),
                                                child: Text(
                                                    'Choose your profile picture',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black)),
                                              ),
                                              Expanded(child: SizedBox()),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  width:
                                                      25.0, // you can adjust the width as you need
                                                  child: IconButton(
                                                      icon: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: Colors.grey,
                                                          size: 15),
                                                      onPressed: () =>
                                                          getImage())),
                                              SizedBox(width: 5)
                                            ])),
                                  ])),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.lock, size: 18),
                                      labelText: 'Full Name as per IC/Passport',
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                      hintText: 'Name',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ))),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.lock, size: 18),
                                      labelText: 'IC/Passport',
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ),
                                      hintText: '123444',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ))),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: 'Date of Birth*',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                      ))),
                              SizedBox(
                                height: 8,
                              ),
                              CheckboxListTile(
                                title: Text(
                                    "My passport number is the same as the one used when I registered for the MySJ app",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                value: checkedValue,
                                contentPadding: EdgeInsets.all(0),
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValue = newValue;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                  decoration: const InputDecoration(
                                hintText: 'Passport No.',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                              )),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.arrow_drop_down),
                                    hintText: 'Country of Origin',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.0,
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                      'Can I change my other information such as home address?',
                                      style: TextStyle(color: Colors.grey))),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                    "MySejahtera helpdesk would be glad to help you. Click on 'MySejahtera Helpdesk' and let us know.",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic)),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                      'Why can I no longer change my name and IC number?',
                                      style: TextStyle(color: Colors.grey))),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                    "Your name and IC number has been varified hence you would not be able to edit it anymore",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic)),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                      'Do I need to input passport number?',
                                      style: TextStyle(color: Colors.grey))),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                    "Passport number is required if you are going to travel overseas",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic)),
                              )
                            ]))))),
      ]),
    );
    alertPopup(BuildContext context) {
      Widget okButton = TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK', style: TextStyle(color: Colors.blue)));
      AlertDialog alert = AlertDialog(
          insetPadding: EdgeInsets.symmetric(vertical: 90),
          title: Text(
            "Successfull!",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Profile picture successfully uploaded!",
            style: TextStyle(fontSize: 13),
            textAlign: TextAlign.center,
          ),
          actions: [okButton]);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

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
                    MaterialPageRoute(builder: (context) => Settings()))),
            Text('       My Details',
                style: TextStyle(
                    fontSize: 22,
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
                      Container(
                          width: 10,
                          child: Obx(() {
                            if (loginController.popup1.value)
                              return alertPopup(context);
                            else
                              return SizedBox();
                          })),
                      Obx(() {
                        if (loginController.isLoading1.value)
                          return Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Color(0xffEEEEEE),
                          ));
                        return Container();
                      }),
                      TextButton(
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFF3A83FF)),
                              height: 35,
                              width: 70,
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                                  child: Text('Save',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center))),
                          onPressed: () => {
                                loginController.photoUp(_image.path),
                                Timer(
                                    Duration(seconds: 4),
                                    () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage())))
                              })
                    ],
                  )),
            ])));
    // Container(
    //     color: Color(0xffECF0F1), child: Column(children: [profilePage]))
  }
}

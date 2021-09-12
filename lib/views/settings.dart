import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_blog_app/Models/api.dart';
import 'package:simple_blog_app/views/layout.dart';
import 'package:simple_blog_app/views/login.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Controllers/loginController.dart';

final LoginController loginController = Get.put(LoginController());

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

bool isload = false;

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    logout() async {
      setState(() {
        isload = true;});
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      Future.delayed(Duration(milliseconds: 700), () {
        setState(() {
          isload = false;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
          loginController.user.value = null;
        });
      });
    }

    List<ProfileItem> general = [
      new ProfileItem(
          icon1: CircleAvatar(
            radius: 16.0,
            backgroundColor: Colors.white,
            backgroundImage:
                NetworkImage(Api().base + loginController.user.value.image),
          ),
          itemName: 'My Personal Details',
          icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15)),
      new ProfileItem(
          icon1: CircleAvatar(
            radius: 16.0,
            backgroundImage: AssetImage('img/id-edit.png'),
          ),
          itemName: 'Change MySJ ID',
          icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15)),
      new ProfileItem(
          icon1: CircleAvatar(
            radius: 16.0,
            backgroundImage: AssetImage('img/lock.png'),
          ),
          itemName: 'Change my Password',
          icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15)),
      new ProfileItem(
          icon1: CircleAvatar(
            radius: 16.0,
            backgroundImage: AssetImage('img/my-seja.png'),
          ),
          itemName: 'MySejahtera Helpdesk',
          icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15)),
      new ProfileItem(
          icon1: CircleAvatar(
            radius: 16.0,
            backgroundImage: AssetImage('img/langu.png'),
          ),
          itemName: 'Change language',
          icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15)),
      new ProfileItem(
          icon1: CircleAvatar(
            radius: 16.0,
            backgroundImage: AssetImage('img/privacy.png'),
          ),
          itemName: 'Privacy Policy',
          icon2: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15)),
      new ProfileItem(
          icon1: CircleAvatar(
            radius: 16.0,
            backgroundImage: AssetImage('img/logout.png'),
          ),
          itemName: 'Logout',
          icon2: 
          Container(
              padding: const EdgeInsets.all(0.0),
              width: 25.0, // you can adjust the width as you need
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15),
                 onPressed: () => logout())
              ),
            ),
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
                                              9, 10, 10, 10),
                                          child: e.icon1),
                                      Container(
                                          height: 60.0,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              70,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 7, 0, 5),
                                                  child: Text(e.itemName,
                                                      style: TextStyle(
                                                          fontSize: 14,
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
                icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Layout()))),
            Text('       Settings',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ]),
        ),
        body: Container(
            color: Color(0xffECF0F1), child: Column(children: [profilePage, 
            Container(child:isload==true?CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xffEEEEEE))
            ):SizedBox())])));
  }
}

class ProfileItem {
  Widget icon1;
  String itemName;
  Widget icon2;

  ProfileItem({this.icon1, this.itemName, this.icon2});
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_blog_app/Models/Blog.dart';
import 'package:url_launcher/url_launcher.dart';

class SubCategory extends StatelessWidget {
  List<Blog> clist;
  SubCategory(this.clist);
  _launchURLWeb() async {
    const url =
        'https://mysejahtera.malaysia.gov.my/help_en/?data=eyJhcHBWZXJzaW9uIjoiMS4wLjQ1IiwiZGV2aWNlTW9kZWwiOiJDUEgxODIzIiwidXNlclN0YXR1cyI6IkxvdyIsImVtYWlsIjoibWFobXVkdXJyMzQzQGdtYWlsLmNvbSJ9';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<ProfileItem> general = [
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 18.0,
          backgroundImage: AssetImage('img/COVID---19-Status.png'),
        ),
        itemName: 'Update My COVID-19 Risk Status',
        ),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 18.0,
          backgroundImage: AssetImage('img/location.png'),
        ),
        itemName: 'Hotspot Tracker',
        ),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 18.0,
          backgroundImage: AssetImage('img/dependent.png'),
        ),
        itemName: 'Manage Dependents',
        ),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 18.0,
          backgroundImage: AssetImage('img/COVID---19--Vaccination.png'),
        ),
        itemName: 'COVID-19 Self Test',
        ),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 18.0,
          backgroundImage: AssetImage('img/health-faci.png'),
        ),
        itemName: 'Local Health Screening Facility',
        ),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 18.0,
          backgroundImage: AssetImage('img/digital-health.png'),
        ),
        itemName: 'Digital Healthcare',
        ),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 18.0,
          backgroundImage: AssetImage('img/vaccin3.png'),
        ),
        itemName: 'Additional Resources',
        ),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 18.0,
          backgroundImage: AssetImage('img/test3.png'),
        ),
        itemName: 'Behavior',
        ),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 18.0,
          backgroundImage: AssetImage('img/help-desk.png'),
        ),
        itemName: 'Helpdesk',
        ),
    new ProfileItem(
        icon1: CircleAvatar(
          radius: 18.0,
          backgroundImage: AssetImage('img/vaccine2.png'),
        ),
        itemName: 'FAQs',
        ),
  ];

  @override
  Widget build(BuildContext context) {
    bottomSheet() {
      return showModalBottomSheet(
        isScrollControlled: true,
         shape: RoundedRectangleBorder(	 borderRadius: BorderRadius.circular(10.0),
        ),
          context: context,
          backgroundColor: Color(0xffFFFFFF),
          builder: (context) {
            return Container(
              height: 550,
              child: Column(children: [
                Container(height: 500,
                child:ListView(children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Text('Choose Action', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
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
                                               90,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 7, 0, 5),
                                                    child: Text(e.itemName,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black)),
                                                  )
                                                ])),
                                      ]))
                                  .toList())),
            ])),
            TextButton(onPressed: ()=>Navigator.pop(context), 
            child: Text('Back', style:TextStyle(color:Colors.blueAccent)))
              ])
            );
          });
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(0.0),
          crossAxisCount: 3,
          childAspectRatio: .96,
          children: clist
              .map((e) => Column(children: [
                    TextButton(
                        onPressed: () {
                          switch (e.title) {
                            case 'Helpdesk':
                              {
                                _launchURLWeb();
                                break;
                              }
                            case 'More':
                              {
                                bottomSheet();
                                break;
                              }
                            default:
                              {
                                Navigator.pushReplacementNamed(
                                    context, e.description);
                              }
                          }
                          // e.title=='Helpdesk'?_launchURLWeb():
                          // Navigator.pushReplacementNamed(context, e.description);
                        },
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
                          child: CircleAvatar(
                            radius: 21.0,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(e.coverPhoto),
                          ),
                        ))),
                    Text(" " + e.title,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color(0xff666666)),
                        textAlign: TextAlign.center)
                  ]))
              .toList()),
    );
  }
}

class ProfileItem {
  Widget icon1;
  String itemName;
  Widget icon2;

  ProfileItem({this.icon1, this.itemName, this.icon2});
}

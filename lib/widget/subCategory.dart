import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_blog_app/Models/Blog.dart';
import 'package:url_launcher/url_launcher.dart';

class SubCategory extends StatelessWidget {
  List<Blog> clist;
  SubCategory(this.clist);
_launchURLWeb() async {
    const url = 'https://mysejahtera.malaysia.gov.my/help_en/?data=eyJhcHBWZXJzaW9uIjoiMS4wLjQ1IiwiZGV2aWNlTW9kZWwiOiJDUEgxODIzIiwidXNlclN0YXR1cyI6IkxvdyIsImVtYWlsIjoibWFobXVkdXJyMzQzQGdtYWlsLmNvbSJ9';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(0.0),
          crossAxisCount: 3,
          childAspectRatio: .9,
          children: clist
              .map((e) => Column(children: [
                    TextButton(
                        onPressed: () {
                          e.title=='Helpdesk'?_launchURLWeb():
                          Navigator.pushReplacementNamed(context, e.description);
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
                            fontSize: 13,
                            color: Color(0xff666666)),
                        textAlign: TextAlign.center)
                  ]))
              .toList()),
    );
  }
}

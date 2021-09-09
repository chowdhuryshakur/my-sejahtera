import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_blog_app/views/home.dart';
import 'package:simple_blog_app/views/layout.dart';

class StatusPage extends StatefulWidget {
  StatusPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
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
            Text('           Status',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ]),
        ),
        body: Column(children: [
          Expanded(
              flex: 1,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 8),
                  Center(
                      child: Container(
                    height: 130.0,
                    width: 130.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('img/logo.png'))),
                  )),
                  SizedBox(height: 30),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.only(left:30, right:30),
                          child: Text('Are you a low risk person who has:',
                              style: TextStyle(
                                  color: Colors.grey[900], fontSize: 19),
                              textAlign: TextAlign.left))),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(left:5, right:12),
                    child: UnorderedList([
                      "Started exhibiting COVID-19 symptoms?",
                      "Travelled overseas, had contact with a positive COVID-19 patient or attended any mass gathering in the past 14 days?"
                    ]),
                  )),
                  SizedBox(height: 10),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.only(left:35, right:30),
                          child: Text('If your answer is "Yes" to any of the above, kindly update your health status.',
                              style:
                                  TextStyle(color: Colors.grey[600], fontSize: 18),
                              textAlign: TextAlign.left))),
                  SizedBox(height: MediaQuery.of(context).size.height*.09),
                  TextButton(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFF3A83FF)),
                          height: 35,
                          width: MediaQuery.of(context).size.width-20,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(50, 6, 50, 6),
                              child: Text('Start',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                  textAlign: TextAlign.center))),
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()))),
                ],
              )),
        ]));
  }
}

class UnorderedList extends StatelessWidget {
  UnorderedList(this.texts);
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem(text));
      // Add space between items
      widgetList.add(SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  UnorderedListItem(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("• ",
                style: TextStyle(color: Colors.grey[900], fontSize: 28),
                textAlign: TextAlign.left),
            Expanded(
              child: Text(text,
                  style: TextStyle(color: Colors.grey[900], fontSize: 17)),
            ),
          ],
        ));
  }
}

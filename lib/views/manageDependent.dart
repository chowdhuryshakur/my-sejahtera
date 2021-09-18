import 'package:flutter/material.dart';
import 'package:simple_blog_app/views/layout.dart';
import 'package:simple_blog_app/views/vaccination.dart';

class ManageDependent extends StatefulWidget {
  @override
  _ManageDependentState createState() => _ManageDependentState();
}

class _ManageDependentState extends State<ManageDependent> {
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
                                  child: Text(
                                      'My Dependents',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text('Note: Please add only dependents who do not have access to a smartphone',
                                      style: TextStyle(color: Colors.grey))),  
                            ]))))),
                            SizedBox(height: MediaQuery.of(context).size.height-265,),
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
                                color: Color(0xFF3A83FF)),
                            height: 35,
                            width: 150,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                                child: Text('Add dependents',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
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
            Text('Manage Dependents',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ]),
        ),
        body: Container(
            color: Color(0xffECF0F1), child: Column(children: [profilePage])));
  }
}

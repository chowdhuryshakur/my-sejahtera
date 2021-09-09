import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(child: Stack(children: <Widget>[
            // The containers in the background
            new Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .35,
                  color: Color(0xFF3A83FF),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .65,
                  color: Color(0xFFECF0F1),
                )
              ],
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: new EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .04,
                    right: 10.0,
                    left: 10.0),
                child: Text('Statistics',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right)),
            Container(
                alignment: Alignment.topCenter,
                padding: new EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .10,
                    right: 10.0,
                    left: 10.0),
                child: Column(
                  children: [
                    Container(
                      height: 300.0,
                      width: MediaQuery.of(context).size.width,
                      child: new Card(
                        color: Color(0xff0B32F4),
                        elevation: 1.0,
                        child: Center(child: Text('No data',style: TextStyle(color: Colors.white,)),
                      ),
                  ))]))]),)
        );
  }
}

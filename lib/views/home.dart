import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Controllers/cprcController.dart';
import 'package:simple_blog_app/Models/Blog.dart';
import 'package:simple_blog_app/Models/api.dart';
import 'package:simple_blog_app/Models/cprc.dart';
import 'package:simple_blog_app/widget/subCategory.dart';
import 'package:simple_blog_app/views/statistics.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

List<Blog> Blogs = [
  new Blog(
      title: 'COVID 19 Status',
      description: '/status',
      coverPhoto: 'img/COVID---19-Status.png'),
  new Blog(
      title: 'COVID 19 Vaccination',
      description: '/vaccination',
      coverPhoto: 'img/COVID---19--Vaccination.png'),
  new Blog(
      title: 'COVID 19 Self Test',
      coverPhoto: 'img/COVID---19-Self-Test.png',
      description: '/test'),
  new Blog(
      title: 'Digital Health',
      coverPhoto: 'img/COVID---19-Status.png',
      description: '/digitalHealth'),
  new Blog(title: 'Hotspot', coverPhoto: 'img/digital-health.png'),
  new Blog(
      title: 'Helpdesk',
      description: 'this is the description',
      coverPhoto: 'img/COVID---19-Status.png'),
  new Blog(
      title: 'Manage Dependents',
      description: 'this is the description',
      coverPhoto: 'img/COVID---19-Self-Test.png'),
  new Blog(
      title: 'Health Facilities',
      description: 'this is the description',
      coverPhoto: 'img/COVID---19-Status.png'),
  new Blog(
      title: 'More',
      description: 'this is the description',
      coverPhoto: 'img/COVID---19-Self-Test.png'),
];
final CprcController cprcController = Get.put(CprcController());
final df = new DateFormat('dd MMM yyyy');
final df1 = new DateFormat('dd MM yyyy hh:mm a');
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _showAppbar = false;
  ScrollController _scrollBottomBarController = new ScrollController();
  bool isScrollingDown = true;

  @override
  void initState() {
    super.initState();
    myScroll();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollBottomBarController.removeListener(() {});
    super.dispose();
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isScrollingDown) {
          setState(() {
            isScrollingDown = true;
            _showAppbar = false;
          });
        }
      }
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isScrollingDown) {
          setState(() {
            isScrollingDown = false;
            _showAppbar = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    cprcRow(List<CPRC> clist) {
      return ListView(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(1),
          children: clist
              .map((item) =>  Container(
                        height: 420.0,
                        width: MediaQuery.of(context).size.width,
                        child: new Card(
                            color: Colors.white,
                            elevation: 1.0,
                            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 15, 0, 5),
                                      child: CircleAvatar(
                                        radius: 22.0,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            AssetImage('img/s2.png'),
                                      ),
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 15, 10, 5),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child: Text('CPRC KKM        ',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17)),
                                            )),
                                        SizedBox(height: 3),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                                child: Text(
                                                 df.format(item.date)+', '+df1.format(DateFormat("HH:mm").parse(item.time)).split(' ')[3]+' '+df1.format(DateFormat("HH:mm").parse(item.time)).split(' ')[4],
                                                    //item.date. .toString()+', '+item.time,
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13))))
                                      ]),
                                    )
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 12, 10, 0),
                                    child: Text(item.title,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                        textAlign: TextAlign.left)),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 0, 10, 0),
                                    child: Text(
                                                    item.link!=null?item.link:'',
                                                    style: TextStyle(
                                                        color: Colors.blueAccent,
                                                        fontSize: 11))),
                                SizedBox(height: 8),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(Api().base+item.image))),
                                )
                              ],
                            ))))
              .toList());
    }
    return Scaffold(
        appBar: _showAppbar
            ? AppBar(
                centerTitle: true,
                title: Text('MySejahtera', style: TextStyle(fontSize: 25)),
                backgroundColor: Color(0xff3A83FF),
                elevation: 0)
            : PreferredSize(
                child: Container(),
                preferredSize: Size(0.0, 0.0),
              ),
        body: ListView(controller: _scrollBottomBarController, children: [
          Stack(children: <Widget>[
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
                    top: MediaQuery.of(context).size.height * .02,
                    right: 10.0,
                    left: 10.0),
                child: Text('MySejahtera',
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
                      height: 305.0,
                      width: MediaQuery.of(context).size.width,
                      child: new Card(
                        color: Colors.white,
                        elevation: 1.0,
                        child: SubCategory(Blogs),
                      ),
                    ),
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      child: new Card(
                        color: Colors.white,
                        elevation: 1.0,
                        child: DefaultTabController(
                          length: 2,
                          child: TabBar(
                            indicatorColor: Colors.red,
                            unselectedLabelStyle:
                                TextStyle(color: Color(0xff757575)),
                            tabs: [
                              Tab(
                                  child: Text('Things to know',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16))),
                              Tab(
                                  child: Text('Things to do',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16))),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Obx(() {
           if (cprcController.isLoading.value)
            return Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 250),
                    child: CircularProgressIndicator()));
          return cprcRow(cprcController.cprcList);
       }) ],
                ))
          ]),
        ]));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_blog_app/Controllers/cprcController.dart';
import 'package:simple_blog_app/Models/Blog.dart';
import 'package:get/get.dart';

class BlogList extends StatefulWidget {
  @override
  BlogListState createState() => BlogListState();
}

//final BlogController blogController = Get.put(BlogController());

class BlogListState extends State<BlogList> {
  @override
  Widget build(BuildContext context) {
    blogRow(List<Blog> clist) {
      return ListView(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(1),
          children: clist
              .map((item) => Container(
                  height: 250,
                  child: Column(children: [
                    Container(
                        height: 200,
                        width: 500,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(item.coverPhoto))),
                        child: FlatButton(onPressed: () {
                          Future.delayed(Duration(milliseconds: 100), () {
                            setState(() {
                              // blogController.fetchBlogById(item.id);
                              // Navigator.pushNamed(context, "/detail");
                            });
                          });
                        })),
                    Container(
                      height: 50,
                      color: Colors.red[900],
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            item.title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.left,
                          )),
                    )
                  ])))
              .toList());
    }

    return Scaffold(
      appBar: AppBar(title: Text('Blogs')),
      body: Center(
          child: ListView(children: [
        // Container(child: Obx(() {
        //   if (blogController.isLoading.value)
        //     return Center(
        //         child: Padding(
        //             padding: EdgeInsets.only(top: 250),
        //             child: CircularProgressIndicator()));
        //   return blogRow(blogController.BlogList);
        // }))
      ])),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.offline_bolt),
              label: 'Other',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.amber[800]),
    );
  }
}


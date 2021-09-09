import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Controllers/cprcController.dart';

class BlogDetailPage extends StatefulWidget {
  @override
  BlogDetailPageState createState() => BlogDetailPageState();
}

//final BlogController blogController = Get.put(BlogController());

class BlogDetailPageState extends State<BlogDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blog's detail")),
      body: Center(child: Obx(() {
        // if (blogController.isLoading.value)
        //   return Center(child: CircularProgressIndicator());
        return ListView(children: [
          Container(
            height: 300,
            width: 500,
            decoration: BoxDecoration(
                // image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: NetworkImage(blogController.blog.value.coverPhoto))
                    ),
          ),
          Card(
              child: Padding(
                  padding: EdgeInsets.all(5),
                  // child: Text(blogController.blog.value.title,
                  //     style: TextStyle(
                  //         fontSize: 16, fontWeight: FontWeight.bold))
                          )),
          Card(
              child: Padding(
                  padding: EdgeInsets.all(5),
                  //child: Text(blogController.blog.value.description)
          ))
        ]);
      })),
    );
  }
}

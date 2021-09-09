import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_blog_app/Models/Blog.dart';

class SubCategory extends StatelessWidget {
  List<Blog> clist;
  SubCategory(this.clist);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(0.0),
          crossAxisCount: 3,
          childAspectRatio: 1,
          children: clist
              .map((e) => Column(children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, e.description);
                        },
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
                          child: CircleAvatar(
                            radius: 18.0,
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

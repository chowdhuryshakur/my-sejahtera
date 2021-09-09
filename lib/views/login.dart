import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_blog_app/views/layout.dart';
import 'package:get/get.dart';
import 'package:simple_blog_app/Controllers/loginController.dart';

final TextEditingController number = TextEditingController();
final TextEditingController password = TextEditingController();
final _formKey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool _isObscure = true;
final LoginController loginController = Get.put(LoginController());

class _LoginPageState extends State<LoginPage> {
  bool isloading = false;
  login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        loginController.mail.value = number.text;
        loginController.password.value = password.text;
        isloading = true;
      });
      loginController.fetchUser();
      Future.delayed(Duration(milliseconds: 10000), () {
        if (loginController.user.value.id != null)
          setState(() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Layout()));
            isloading = false;
          });
        else
          alertPopup(context);
          setState(() {
            isloading = false;
          });
      });
    }
  }
alertPopup(BuildContext context) {
    Widget okButton =
        FlatButton(onPressed: () => Navigator.pop(context), child: Text('OK'));
    AlertDialog alert = AlertDialog(
      title: Text("Incorrect Credential"),
      content: Text("You email or password is incorrect."),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          flex: 1,
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('img/logo.png'))),
                  )),
                  SizedBox(height: 30),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                            border: Border.all(color: Colors.grey[600])),
                        child: SizedBox(
                            height: 38.0,
                            width: MediaQuery.of(context).size.width * .35,
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                              hint: Text('    MY(+60)',
                                  style: TextStyle(fontSize: 15)),
                              items: <String>['MY(+60)', 'B', 'C', 'D']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            )))),
                    SizedBox(width: 10),
                    Container(
                        child: SizedBox(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width * .55,
                      child: TextFormField(
                        controller: number,
                        decoration: new InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.black38)),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            contentPadding: EdgeInsets.only(
                                bottom: 5.0, left: 10.0, right: 10.0),
                            hintStyle: new TextStyle(
                                color: Colors.black54, fontSize: 15.0),
                            hintText: "Mobile number"),
                      ),
                    )),
                  ]),
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                        child: SizedBox(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width - 23,
                      child: TextFormField(
                        controller: password,
                        decoration: new InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.black38)),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            contentPadding: EdgeInsets.only(
                                bottom: 5.0, left: 10.0, right: 10.0),
                            hintStyle: new TextStyle(
                              color: Colors.black54,
                              fontSize: 15.0,
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey[400]),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            hintText: "Password"),
                        obscureText: _isObscure,
                      ),
                    )),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(140, 5, 0, 0),
                      child: Text('Login with email',
                          style: TextStyle(
                              color: Color(0xFF3A83FF),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right)),
                  SizedBox(height: MediaQuery.of(context).size.height * .06),
                  TextButton(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFF3A83FF)),
                          height: 35,
                          width: MediaQuery.of(context).size.width - 20,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(50, 6, 50, 6),
                              child: Text('Sign In',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                  textAlign: TextAlign.center))),
                      onPressed: () => login()),
                  TextButton(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xFF3A83FF))),
                          height: 35,
                          width: MediaQuery.of(context).size.width - 20,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(50, 6, 50, 6),
                              child: Text('Register Here',
                                  style: TextStyle(
                                      color: Color(0xFF3A83FF), fontSize: 15),
                                  textAlign: TextAlign.center))),
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()))),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                        child: Text('Forgot password?',
                            style: TextStyle(
                                color: Color(0xFF3A83FF),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right)),
                  ),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Text('Need Help?',
                              style: TextStyle(
                                  color: Color(0xFF3A83FF), fontSize: 14),
                              textAlign: TextAlign.right))),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Text('Strategic Collaboration',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                              textAlign: TextAlign.right))),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Text('NSC\u2022MOH\u2022MAMPU\u2022MCMC',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                              textAlign: TextAlign.right))),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Text('App Version 1.0.45',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        textAlign: TextAlign.right),
                  )),
                ],
              ))),
    ]));
  }
}

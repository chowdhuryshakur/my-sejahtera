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
      Future.delayed(Duration(milliseconds: 5000), () {
        if (loginController.user.value.id != null)
          setState(() {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Layout()));
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
    Widget okButton = TextButton(onPressed: () => Navigator.pop(context), child: Text('OK', style: TextStyle(color: Colors.blue)));
    AlertDialog alert = AlertDialog(
      insetPadding: EdgeInsets.symmetric(vertical: 90),
      title: Text("Login",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
      content: Text("Invalid user ID or passwordd", style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),
      actions: [okButton]
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Expanded(
          flex: 1,
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: <Widget>[
                  SizedBox(height: 50),
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
                  SizedBox(height: 60),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                            border: Border.all(color: Colors.grey[300])
                        ),
                        child: SizedBox(
                            height: 38.0,
                            width: MediaQuery.of(context).size.width * .35,
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                              hint: Text('    MY(+60)',
                                  style: TextStyle(fontSize: 15)),
                              items: <String>[
                                'MY (+60)',
                                'AF (+93)',
                                'DZ (+213)', 
                                'AS (+1 684)',
                                'BD (+880)'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            )))),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                            border: Border.all(color: Colors.grey[300])
                        ),
                        child: SizedBox(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width * .55,
                      child: TextFormField(
                        controller: number,
                        decoration: new InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffE0E0E0))),
                            contentPadding: EdgeInsets.only(
                                bottom: 8.0, left: 10.0, right: 10.0),
                            hintStyle: new TextStyle(
                                color: Colors.black54, fontSize: 13.0),
                            hintText: "Mobile number"),
                      ),
                    )),
                  ]),
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                       decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                            border: Border.all(color: Colors.grey[300])
                        ),
                        child: SizedBox(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width - 23,
                      child: TextFormField(
                        controller: password,
                        decoration: new InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            contentPadding: EdgeInsets.only(
                                bottom: 5.0, left: 10.0, right: 10.0),
                            hintStyle: new TextStyle(
                              color: Colors.black54,
                              fontSize: 13.0,
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(
                                    _isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility, size: 18,
                                    color: Colors.grey[400]),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            hintText: "Password"),
                        obscureText: _isObscure,
                      ),
                    )
                    
                    
                    ),
                    
                  ),
                  Align( 
                    alignment: Alignment.topRight,
                child:Padding(padding: EdgeInsets.fromLTRB(0, 5, MediaQuery.of(context).size.width*.04, 0),
                  child:Text('Login with email',
                          style: TextStyle(
                              color: Color(0xFF3A83FF),
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                          ),
                          //textAlign: TextAlign.right,
                      ))),
                  SizedBox(height: MediaQuery.of(context).size.height * .06),
                    Obx(() {
           if (loginController.isLoading2.value)
            return Center(
                child: CircularProgressIndicator(backgroundColor: Color(0xffEEEEEE),));
          return Container();
            }),
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
                                      color: Colors.white, fontSize: 12),
                                  textAlign: TextAlign.center))),
                      onPressed: () => login()),
                      SizedBox(height: 15),
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
                                      color: Color(0xFF3A83FF), fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center))),
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()))),
                  SizedBox(height: 20),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                        child: Text('Forgot password?',
                            style: TextStyle(
                                color: Color(0xFF3A83FF),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right)),
                  ),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Text('Need Help?',
                              style: TextStyle(
                                  color: Color(0xFF3A83FF), fontSize: 10),
                              textAlign: TextAlign.right))),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Text('Strategic Collaboration',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                              textAlign: TextAlign.right))),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Text('NSC\u2022MOH\u2022MAMPU\u2022MCMC',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                              textAlign: TextAlign.right))),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Text('App Version 1.0.45',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                        textAlign: TextAlign.right),
                  )),
                ],
              ))),
    ]));
  }
}

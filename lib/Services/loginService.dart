import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:simple_blog_app/Models/api.dart';

class LoginService {

  loginFetch(String mail, String pass) async {
    Map<String, dynamic> json = {
      'mysj_id': mail,
      'password': pass,
    };
    final res = await post(Api().login, body: json);
    if (res.statusCode == 200) {
        return res.body;
    } else {
      throw "Can't  create user";
    }
  }
}

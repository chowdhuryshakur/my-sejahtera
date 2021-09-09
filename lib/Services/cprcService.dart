import 'dart:convert';
import 'package:http/http.dart';
import 'package:simple_blog_app/Models/Blog.dart';
import 'package:simple_blog_app/Models/api.dart';
import 'package:simple_blog_app/Models/cprc.dart';

class CPRCService {
  static String apiUrl = Api().cprc;

  Future<List<CPRC>> getCPRC() async {
    Response res = await get(apiUrl);
    if (res.statusCode == 200) {
      // Map<String, dynamic> map = json.decode(res.body);
      // List<dynamic> data = map["CPRCs"];
       List<dynamic> data = json.decode(res.body);
      List<CPRC> cprc =
          data.map((dynamic item) => CPRC.fromJson(item)).toList();
      return cprc;
    } else {
      throw "Failed to load profile list";
    }
  }
}

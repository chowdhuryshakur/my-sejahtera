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
 var headerWithToken = {
    "Content-type": "application/json;charset=UTF-8",
    'authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzQxOGEyNDQ5MWIwNTA3MjkzNjczN2RjNDJkZGI4MThjMmNhZmM2MmYxMTc0Zjk2NmY2MzVhMWIxNGQyOWQxOGMyYzI5ZDBlNDA5ZDU0MzMiLCJpYXQiOjE2MzE2NTc5NDEuOTAwNjcwMDUxNTc0NzA3MDMxMjUsIm5iZiI6MTYzMTY1Nzk0MS45MDA2NzQxMDQ2OTA1NTE3NTc4MTI1LCJleHAiOjE2NjMxOTM5NDEuODk4NzMyOTAwNjE5NTA2ODM1OTM3NSwic3ViIjoiMiIsInNjb3BlcyI6W119.kpXt1r0Pq3VKMuHCD0wTUnpopUL-ShWoMgCDvZok75bZDiuloT0y2ny5KrGKbtx8LCJBkTODIputFVPXFIr_6FDJpG1pZaCok-671iwCJay97xy2fo5HOvkw460aJ10HPT8pz1gKdLB3dPRWaoQySEhJK1camLp_3j15UbXojDHAxyyk5hinqNZfot2qt6eBRTtuLxuXXwC_NJpsIXdb1PpOPi5RF0d7ZwBn7lh1cSpXuVkxA5_lgVMoYxyzpF4sC7qCuQSXCxmTtBmN8WgYC7wKwxnbTSQPBT6kPZn9qeWcqPBvr3rlvP5q4lzpp-azwsrQagFi8fkUByZWXOswFUa_UlPgN22Cf2pppkYnk_mRhAPPWVupIPIcegysn6dRfDJKR-gPR-TgegQBQSEqKB3rvYudxJNDelV5L6NuiZcYSEQmDqMSRVspcTn7fsJGMRzrLAwgNghNpS5AzQzEW5Fk6PVlc_BERUMWA0yVM-yjmT4nyHe0GZeQXv3H01VbzB2CpA1CzOveSuerxzQr_gkStA1QcHPKyN4Xugs9F0penl3iz9DF5bo42fcCeDgsNooFEq6jdLlhEUuotpkLMfmoIVJ8xHyuznfHJ9tIzc13p7iSojlaKWYiVae72L3KeNUFs9gBRnYlCzEMPQTkFkUUXAdQbKBbOzYWmQmv1A4'
  };
  upImage(int id, String token, String filepath) async {
    var request = http.MultipartRequest('POST', Uri.parse(Api().upImg+id.toString()))
      ..headers.addAll({
        "Content-type": "application/json;charset=UTF-8",
        'authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzQxOGEyNDQ5MWIwNTA3MjkzNjczN2RjNDJkZGI4MThjMmNhZmM2MmYxMTc0Zjk2NmY2MzVhMWIxNGQyOWQxOGMyYzI5ZDBlNDA5ZDU0MzMiLCJpYXQiOjE2MzE2NTc5NDEuOTAwNjcwMDUxNTc0NzA3MDMxMjUsIm5iZiI6MTYzMTY1Nzk0MS45MDA2NzQxMDQ2OTA1NTE3NTc4MTI1LCJleHAiOjE2NjMxOTM5NDEuODk4NzMyOTAwNjE5NTA2ODM1OTM3NSwic3ViIjoiMiIsInNjb3BlcyI6W119.kpXt1r0Pq3VKMuHCD0wTUnpopUL-ShWoMgCDvZok75bZDiuloT0y2ny5KrGKbtx8LCJBkTODIputFVPXFIr_6FDJpG1pZaCok-671iwCJay97xy2fo5HOvkw460aJ10HPT8pz1gKdLB3dPRWaoQySEhJK1camLp_3j15UbXojDHAxyyk5hinqNZfot2qt6eBRTtuLxuXXwC_NJpsIXdb1PpOPi5RF0d7ZwBn7lh1cSpXuVkxA5_lgVMoYxyzpF4sC7qCuQSXCxmTtBmN8WgYC7wKwxnbTSQPBT6kPZn9qeWcqPBvr3rlvP5q4lzpp-azwsrQagFi8fkUByZWXOswFUa_UlPgN22Cf2pppkYnk_mRhAPPWVupIPIcegysn6dRfDJKR-gPR-TgegQBQSEqKB3rvYudxJNDelV5L6NuiZcYSEQmDqMSRVspcTn7fsJGMRzrLAwgNghNpS5AzQzEW5Fk6PVlc_BERUMWA0yVM-yjmT4nyHe0GZeQXv3H01VbzB2CpA1CzOveSuerxzQr_gkStA1QcHPKyN4Xugs9F0penl3iz9DF5bo42fcCeDgsNooFEq6jdLlhEUuotpkLMfmoIVJ8xHyuznfHJ9tIzc13p7iSojlaKWYiVae72L3KeNUFs9gBRnYlCzEMPQTkFkUUXAdQbKBbOzYWmQmv1A4'
      })
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    final response = await request.send();
    final resbody = await response.stream.bytesToString();
    return resbody;
  }
}

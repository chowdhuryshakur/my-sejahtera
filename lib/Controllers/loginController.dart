import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_blog_app/Models/user.dart';
import 'package:simple_blog_app/Services/loginService.dart';

class LoginController extends GetxController {
  var user = new User().obs;
  var mail = ''.obs;
  var password = ''.obs;
  var isLoading1 = false.obs;
  var isLoading2 = false.obs;

  @override
  void onInit() {
    super.onInit();
    isUserLogedIn();
  }

  void isUserLogedIn() async {
    try {
      isLoading1(true);
      SharedPreferences pref = await SharedPreferences.getInstance();
      var accessToken = pref.getString('accessToken');
      if (accessToken != null) {
        TokenWithUser t = TokenWithUser.fromRawJson(accessToken);
        user.value = t.user;
      }
    } finally {
      isLoading1(true);
    }
  }

  void fetchUser() async {
    try {
      isLoading2(true);
      var data = await LoginService().loginFetch(mail.value, password.value);
      if (data != null) {
        TokenWithUser t = TokenWithUser.fromRawJson(data);
        user.value = t.user;
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("accessToken", data.toString());
      }
    } finally {
      isLoading2(false);
    }
  }
}

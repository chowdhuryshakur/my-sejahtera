import 'package:get/state_manager.dart';
import 'package:simple_blog_app/Models/Blog.dart';
import 'package:simple_blog_app/Models/cprc.dart';
import 'package:simple_blog_app/Services/cprcService.dart';

class CprcController extends GetxController {
  var cprcList = List<CPRC>().obs;
  var cprc = new Blog().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCprc();
    super.onInit();
  }

  void fetchCprc() async {
    try {
      isLoading(true);
      var cprcs = await CPRCService().getCPRC();
      if (cprcs != null) {
        cprcList.value = cprcs;
      }
    } finally {
      isLoading(false);
    }
  }
}

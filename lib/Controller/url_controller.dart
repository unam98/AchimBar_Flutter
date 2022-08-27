import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlController extends GetxController {
  RxString url = "".obs;

  void launchURL(String url) async {
    // 넘겨 받은 url 이 실행 가능한지 체크 후 실행, 불가능하면 에러 출력
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, universalLinksOnly: true);
    } else {
      print('Could not launch $url');
    }
  }
}
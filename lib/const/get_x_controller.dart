import 'package:get/get.dart';

class GetController extends GetxController {
  var count = 0;
  void increment() {
    count++;
    update();
  }
}
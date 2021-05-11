import 'package:get/get.dart';

class BasicTabController extends GetxController {
  RxString _searchStr = ''.obs;

  RxString get searchStr => _searchStr;

  set searchStr(RxString value) {
    _searchStr = value;
    update();
  }

  RxList<String> _searchList = <String>[].obs;

  RxList<String> get searchList => _searchList;

  set searchList(RxList<String> value) {
    _searchList = value;
    update();
  }

  RxBool _status = false.obs;

  RxBool get status => _status;

  set status(RxBool value) {
    _status = value;
    update();
  }
}

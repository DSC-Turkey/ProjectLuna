import 'package:Luna/GetX/FirabaseController.dart';
import 'package:get/get.dart';

class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseController>(() => FirebaseController());
  }
}

import 'dart:async';

import 'package:e_com/ui/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController{
  final box= GetStorage();
  chooseScreen(){
    var value= box.read('user');
    if(value==null){
      Get.offAndToNamed(login);
    }else{
      Get.offAndToNamed(bottomnavbar);
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    Timer(Duration(seconds: 3),()=>chooseScreen());
    super.onInit();
  }
}
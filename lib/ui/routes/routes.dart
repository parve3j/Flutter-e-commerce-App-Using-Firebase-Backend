import 'package:e_com/ui/views/auth/forget_password.dart';
import 'package:e_com/ui/views/auth/login.dart';
import 'package:e_com/ui/views/auth/registration.dart';
import 'package:e_com/ui/views/bottom_nav_controller.dart';
import 'package:get/get.dart';
const String login='/login';
const String registration='/registration';
const String forgetpass='/forgetpass';
const String bottomnavbar='/bottomnavbar';
List<GetPage> getPage=[
  GetPage(name: login, page:()=> Login()),
  GetPage(name: registration, page:()=> Registration()),
  GetPage(name: forgetpass, page:()=> ForgetPassword()),
  GetPage(name: bottomnavbar, page:()=> BottomNavController()),
];
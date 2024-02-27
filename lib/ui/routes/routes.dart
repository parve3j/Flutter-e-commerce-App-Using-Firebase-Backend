import 'package:e_com/business_logic/bindings/auth_bindings.dart';
import 'package:e_com/business_logic/bindings/splash_bindings.dart';
import 'package:e_com/ui/views/auth/forget_password.dart';
import 'package:e_com/ui/views/auth/login.dart';
import 'package:e_com/ui/views/auth/registration.dart';
import 'package:e_com/ui/views/bottom_nav_controller.dart';
import 'package:e_com/ui/views/splash.dart';
import 'package:get/get.dart';
const String login='/login';
const String registration='/registration';
const String forgetpass='/forgetpass';
const String bottomnavbar='/bottomnavbar';
const String splash='/splash';
List<GetPage> getPage=[
  GetPage(name: login, page:()=> Login(),
    binding: AuthBinding(),
  ),
  GetPage(name: registration, page:()=> Registration(),
    binding: AuthBinding(),
  ),
  GetPage(name: forgetpass, page:()=> ForgetPassword(),
    binding: AuthBinding(),
  ),
  GetPage(name: bottomnavbar, page:()=> BottomNavController()),
  GetPage(name: splash, page:()=>Splash(),
    binding: SplashBinding(),
  ),
];
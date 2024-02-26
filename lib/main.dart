import 'package:e_com/const/app_strings.dart';
import 'package:e_com/firebase_options.dart';
import 'package:e_com/ui/routes/routes.dart';
import 'package:e_com/ui/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child){
        return GetMaterialApp(
          title: AppString.appName,
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.leftToRight,
          theme: AppTheme().lightTheme(context),
          darkTheme: AppTheme().darkTheme(context),
          themeMode: ThemeMode.light,
          getPages: getPage,
          initialRoute: login,
        );
      },
    );
  }
}


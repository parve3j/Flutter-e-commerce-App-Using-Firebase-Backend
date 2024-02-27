import 'package:e_com/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Get.offAndToNamed(login);
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}

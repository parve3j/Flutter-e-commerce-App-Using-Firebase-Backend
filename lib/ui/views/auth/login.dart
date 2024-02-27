import 'package:e_com/business_logic/controllers/auth_controller.dart';
import 'package:e_com/const/app_colors.dart';
import 'package:e_com/ui/responsive/size_config.dart';
import 'package:e_com/ui/widgets/custom_button.dart';
import 'package:e_com/ui/widgets/custom_textform_field.dart';
import 'package:e_com/ui/widgets/socialmedia_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: SizeConfig.screenHeight,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Image.asset(
                      'assets/icons/logo.png',
                      width: 40.w,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 20),
                    customFormField(TextInputType.emailAddress,
                        _emailController, context, 'Email', (val) {
                      if (val.isEmpty) {
                        return 'This field can\'t be empty';
                      }
                      if (!val.contains(RegExp(r'\@'))) {
                        return 'Enter a valid email address';
                      }
                    }, prefixIcon: Icons.email_outlined),
                    customFormField(
                      TextInputType.text,
                      _passwordController,
                      context,
                      'Password',
                      (val) {
                        if (val == null) {
                          return 'This field can\'t be empty';
                        }
                      },
                      prefixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('forgetpass');
                        },
                        child: Text(
                          'Forget Password',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 200.w,
                      height: 45.h,
                      child: customButton(
                        'Log In',
                        () {
                          if (_formKey.currentState!.validate()) {
                            Get.find<AuthController>().login(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              context,
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(' or '),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMediaButton('assets/icons/facebook.png'),
                        SizedBox(
                          width: 20,
                        ),
                        SocialMediaButton('assets/icons/search.png'),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'Don\'t have an account?',
                        style: TextStyle(
                          color: AppColors.grayColor,
                        ),
                      ),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed('registration');
                            },
                          text: ' Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ))
                    ]))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

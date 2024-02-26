import 'package:e_com/const/app_colors.dart';
import 'package:e_com/ui/responsive/size_config.dart';
import 'package:e_com/ui/widgets/custom_button.dart';
import 'package:e_com/ui/widgets/custom_textform_field.dart';
import 'package:e_com/ui/widgets/socialmedia_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class Registration extends StatefulWidget {
  Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _nameController= TextEditingController();

  TextEditingController _emailController= TextEditingController();

  TextEditingController _passwordController= TextEditingController();

  final _formKey= GlobalKey<FormState>();
  RxBool _value= false.obs;

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade300,
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
                    Image.asset('assets/icons/logo.png',
                      width: 40.w,
                    ),
                    SizedBox(height: 10,),
                    Text('Sign Up',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 20),
                    customFormField(
                        TextInputType.name,
                        _nameController,
                        context,
                        'Name',
                        (val){},
                      prefixIcon: Icons.person
                    ),
                    customFormField(
                        TextInputType.emailAddress,
                        _emailController,
                        context,
                        'Email',
                            (val){
                              if (val.isEmpty) {
                                return 'this field can\'t be empty';
                              }
                              if (!val.contains(RegExp(r'\@'))) {
                                return 'enter a valid email address';
                              }
                        },
                        prefixIcon: Icons.email_outlined
                    ),
                    customFormField(
                      TextInputType.text,
                      _passwordController,
                      context,
                      'Password',
                          (val){
                        if(val==null){
                          return 'This field can\'t be empty';
                        }
                      },
                      prefixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true,
                    ),
                    Row(
                      children: [
                        Obx(() => Checkbox(
                          checkColor: AppColors.mandarinColor,
                          activeColor: Colors.transparent,
                          side: const BorderSide(color: AppColors.mandarinColor, width: 2),
                            value: _value.value,
                            onChanged: (val){
                              _value.value=val!;
                            },
                        )),
                        Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: 'I accept all the',
                              style: TextStyle(
                                color: AppColors.grayColor
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap=(){},
                              text: 'Terms & Condition',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: customButton(
                          'Sign Up',
                              (){if(_formKey.currentState!.validate() &&
                              _value.value==true){

                          }
                          }
                      ),
                    ),
                    SizedBox(height: 20,),
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
                        SizedBox(width: 20,),
                        SocialMediaButton('assets/icons/search.png'),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text.rich(TextSpan(
                        children:[
                          TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                              color: AppColors.grayColor,
                            ),
                          ),
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap=(){},
                              text: ' Log In',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              )
                          )
                        ]
                    ))
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

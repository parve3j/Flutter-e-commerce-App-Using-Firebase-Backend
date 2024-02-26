import 'package:e_com/ui/responsive/size_config.dart';
import 'package:e_com/ui/widgets/custom_button.dart';
import 'package:e_com/ui/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  TextEditingController _emailController= TextEditingController();
  final _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: SizeConfig.screenHeight,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset('assets/icons/logo.png', width: 40.w,),
                    SizedBox(height: 10),
                    Text(
                      'Forget Password?',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 20),
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
                      prefixIcon: Icons.email_outlined,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: customButton(
                        'Continue',
                          (){

                          }
                      ),
                    ),
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

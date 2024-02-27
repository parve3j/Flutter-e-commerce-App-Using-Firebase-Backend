import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/ui/routes/routes.dart';
import 'package:e_com/ui/style/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController{
  FirebaseAuth _auth= FirebaseAuth.instance;
  final box= GetStorage();
  signUp(name, email, password, context) async{
    AppStyle().progressDialog(context);
    try{
      final credential= await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(credential.user!.uid.isNotEmpty){
        CollectionReference collectionReference= FirebaseFirestore.instance.collection('user');
        collectionReference.doc(email).set({
          'uid': credential.user!.uid,
          'email': email,
          'name': name,
        });
        Map user= {
          'uid': credential.user!.uid,
          'email': email,
          'name': name,
        };
        box.write('user', user);
        Get.back();
        Get.offAndToNamed(bottomnavbar);
        Get.showSnackbar(AppStyle().successSnackBar('SignUp SUccessfull'));
      }
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.back();
        Get.showSnackbar(
            AppStyle().failedSnackBar('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        Get.back();
        Get.showSnackbar(AppStyle().failedSnackBar('The account already exists for that email.'));
      }
    } catch (e) {
      Get.back();
      Get.showSnackbar(AppStyle().failedSnackBar(e));
    }
  }
  login(email, password, context) async{
    AppStyle().progressDialog(context);
    try{
      final credential= await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
      var authCredential = credential.user;
      if(authCredential!.uid.isNotEmpty){
        FirebaseFirestore.instance.collection('user')
            .doc(email)
            .get()
            .then((DocumentSnapshot<Map<String, dynamic>> doc){
              if(doc.exists){
                var data= doc.data();
                Map user={
                  'uid': data!['uid'],
                  'email': data['email'],
                  'name': data['name']
                };
                box.write('user', user);
                Get.offAndToNamed(bottomnavbar);
                Get.showSnackbar(AppStyle().successSnackBar('Login Successfull'));
                Get.back();
              }else{
                Get.showSnackbar(AppStyle().failedSnackBar('No data found'));
                Get.back();

              }
        });

      }else{
        Get.back();
        Get.showSnackbar(
            AppStyle().failedSnackBar('No user found for that email.'));
      }
      // final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      // var authCredential=credential.user;
      // if(authCredential!.uid.isNotEmpty){
      //   Get.offAllNamed(bottomnavbar);
      // }
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.back();
        Get.showSnackbar(
            AppStyle().failedSnackBar('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        Get.back();
        Get.showSnackbar(AppStyle()
            .failedSnackBar('Wrong password provided for that user.'));
      }
    }
  }

  forgetPassword(email, context) async{
    try{
      AppStyle().progressDialog(context);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.back();
      Get.showSnackbar(AppStyle().successSnackBar('Email has been send to $email'));
    }catch (e) {
      Get.back();
      Get.showSnackbar(AppStyle().failedSnackBar('something is wrong.'));
    }
  }
  logout() async{
    _auth.signOut();
  }
}
//Updated
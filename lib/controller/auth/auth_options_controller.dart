import 'package:get/get.dart';
import '../../screen/auth/login.dart';
import '../../screen/auth/register.dart';

class AuthOptionsController extends GetxController{
   void onSignUp ()=> Get.to(() => const Register());
   void onSignIn ()=> Get.to(() => const Login());
   
}
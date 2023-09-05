import 'package:get/get.dart';
import '../../screens/auth/login.dart';
import '../../screens/auth/register.dart';

class AuthOptionsController extends GetxController{
   void onSignUp ()=> Get.to(() => const Register());
   void onSignIn ()=> Get.to(() => const Login());
   
}
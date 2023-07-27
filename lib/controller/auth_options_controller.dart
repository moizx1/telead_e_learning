import 'package:get/get.dart';
import '../screen/login.dart';
import '../screen/register.dart';

class AuthOptionsController extends GetxController{
   void onSignUp ()=> Get.to(() => const Register());
   void onSignIn ()=> Get.to(() => const Login());
   
}
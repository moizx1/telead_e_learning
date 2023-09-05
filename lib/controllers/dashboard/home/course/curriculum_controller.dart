import 'package:get/get.dart';
import 'package:telead_e_learning/widgets/video_player_screen.dart';

class CurriculumController extends GetxController {
  onEnrollTap()=>Get.toNamed('/paymentMethods');
  onLessonTap() {
    Get.to(
      VideoPlayerScreen(url:'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4')
    );
  }
}

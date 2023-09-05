import 'package:get/get.dart';
import 'package:telead_e_learning/widget/video_player_screen.dart';

class CompletedLessonsController extends GetxController {
  onCertificateTap()=>Get.toNamed('/certificate');
  onLessonTap() {
    Get.to(
      VideoPlayerScreen(url:'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4')
    );
  }
}

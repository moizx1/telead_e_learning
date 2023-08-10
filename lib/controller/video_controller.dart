import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  VideoController({required this.url});
  String url;
  late VideoPlayerController videoPlayerController;

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(url),
    );
    videoPlayerController.initialize().then((_) {
      // Refresh the UI when the video initializes
      update();
    });
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
  }

}

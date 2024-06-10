import 'dart:io';

import 'package:video_player/video_player.dart';

class AssetsDir{
  static parse(String src){
    if(true){
      print("data\\flutter_assets\\"+src.replaceAll("/", "\\"));
      return "data\\flutter_assets\\"+src.replaceAll("/", "\\");
    }
    return src;
  }
  static video(String src){
    return false? VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')):VideoPlayerController.file(File("data\\flutter_assets\\assets\\"+src));
  }
}
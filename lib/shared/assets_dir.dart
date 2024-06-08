import 'dart:io';

import 'package:video_player/video_player.dart';

class AssetsDir{
  static parse(String src){
    if(false){
      return "data\\flutter_assets\\"+src.replaceAll("/", "\\");
    }
    return src;
  }
  static video(String src){
    return true?VideoPlayerController.asset(AssetsDir.parse(src)):VideoPlayerController.file(File(AssetsDir.parse(src)));
  }
}
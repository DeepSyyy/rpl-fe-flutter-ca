import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlay extends StatefulWidget {
  const VideoPlay({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  void deactive() {
    _controller.pause();
    super.deactivate();
  }

  void _initVideoPlayer() {
    try {
      final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
      _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
      print("Video initialization successful");
    } catch (e) {
      print("Error initializing video: $e");
    }
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      progressIndicatorColor: AppColor.primary,
      controller: _controller,
      showVideoProgressIndicator: true,
      onReady: () {
        print("Video is ready");
      },
    );
  }
}

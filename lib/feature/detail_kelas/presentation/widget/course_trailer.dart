import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  // late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;
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
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      progressIndicatorColor: AppColor.primary,
      controller: _controller,
      showVideoProgressIndicator: true,
      onReady: () {},
    );
  }
}

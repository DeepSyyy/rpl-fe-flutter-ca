import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  // late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;
  final String videoUrl = "https://www.youtube.com/watch?v=rzRqEWJYwX4";
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
      final videoId = YoutubePlayer.convertUrlToId(videoUrl);
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
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade300),
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            print("Video is ready");
          },
        ),
      ),
    );
  }
}

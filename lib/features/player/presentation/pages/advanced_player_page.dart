// lib/features/player/presentation/pages/advanced_player_page.dart

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AdvancedPlayerPage extends StatefulWidget {
  final String videoUrl;

  // رفع ارور use_super_parameters با استفاده از ساختار جدید {}super.key
  const AdvancedPlayerPage({super.key, required this.videoUrl});

  @override
  State<AdvancedPlayerPage> createState() => _AdvancedPlayerPageState();
}

class _AdvancedPlayerPageState extends State<AdvancedPlayerPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  void initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      aspectRatio: 16 / 9,
      allowFullScreen: true,
      allowPlaybackSpeedChanging: true,
      showControlsOnInitialize: false,
      additionalOptions: (context) => [
        OptionItem(
          // تغییر () به (playerContext) برای رفع ارور نوع آرگومان
          onTap: (playerContext) => debugPrint("باز کردن لیست زیرنویس‌ها"),
          iconData: Icons.subtitles,
          title: 'Subtitles / زیرنویس',
        ),
      ],
      // ادامه‌ی کدها (بستن براکت‌ها و پرانتزهای ChewieController) ...
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized
          ? Chewie(controller: _chewieController!)
          : const Center(child: CircularProgressIndicator(color: Colors.red)),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}

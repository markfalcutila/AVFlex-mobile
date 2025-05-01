import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../src/colors.dart';
import '../widget/custom-appbar.dart';

class CustomVideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String labelText;
  final String labelFooterText;
  final Color boxColor;

  const CustomVideoPlayerScreen(
      {Key? key,
      required this.videoUrl,
      required this.labelText,
      required this.labelFooterText,
      required this.boxColor})
      : super(key: key);

  @override
  _CustomVideoPlayerScreenState createState() =>
      _CustomVideoPlayerScreenState();
}

class _CustomVideoPlayerScreenState extends State<CustomVideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rewind() {
    final currentPosition = _controller.value.position;
    final rewindPosition = currentPosition - const Duration(seconds: 10);
    _controller.seekTo(
        rewindPosition > Duration.zero ? rewindPosition : Duration.zero);
  }

  void _forward() {
    final currentPosition = _controller.value.position;
    final forwardPosition = currentPosition + const Duration(seconds: 10);
    final videoDuration = _controller.value.duration;
    _controller.seekTo(
        forwardPosition < videoDuration ? forwardPosition : videoDuration);
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomBackAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // // ====== HEADER ======
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: GestureDetector(
            //     onTap: () => Navigator.pop(context),
            //     child: const Icon(Icons.arrow_back, color: Colors.black),
            //   ),
            // ),

            // ====== "AVERAGE LEVEL" Title ======
            SizedBox(
              height: deviceHeight * 0.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.labelText,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.090,
                      color: appColors.blackText,
                      fontFamily: 'Poppins-semibold',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ====== VIDEO PLAYER CONTENT (ORANGE BOX) ======
            Container(
              height: deviceHeight * 0.7,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(
                horizontal: 20, // left and right
                vertical: 20, // top and bottom
              ),
              decoration: BoxDecoration(
                color: widget.boxColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // 80% for video
                  Expanded(
                    flex: 8,
                    child: _controller.value.isInitialized
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              width: double.infinity,
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                            ),
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),

                  const SizedBox(height: 10),

                  // 20% for timeline and controls
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VideoProgressIndicator(
                          _controller,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                              playedColor: appColors.grayText.withOpacity(0.4),
                              backgroundColor: appColors.blackText,
                              // bufferedColor: appColors.blackText,
                              bufferedColor: appColors.blackText),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.replay_10),
                              iconSize: 28,
                              onPressed: _rewind,
                            ),
                            IconButton(
                              icon: Icon(
                                  _isPlaying ? Icons.pause : Icons.play_arrow),
                              iconSize: 30,
                              onPressed: _togglePlayPause,
                            ),
                            IconButton(
                              // icon: const Icon(Icons.fast_forward),
                              icon: const Icon(Icons.forward_10),
                              iconSize: 28,
                              onPressed: _forward,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ====== BOTTOM TEXT ======
            Center(
              child: Text(
                widget.labelFooterText,
                style: TextStyle(
                  fontSize: 12,
                  color: appColors.blueText,
                  fontFamily: 'Poppins-semibold',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

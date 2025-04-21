import 'dart:async';
import 'package:avflex/src/colors.dart';
import 'package:avflex/widget/custom-appbar.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const CustomVideoPlayerScreen({super.key, required this.videoUrl});

  @override
  State<CustomVideoPlayerScreen> createState() =>
      _CustomVideoPlayerScreenState();
}

class _CustomVideoPlayerScreenState extends State<CustomVideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  bool _isPlaying = false;
  bool _isMuted = false;
  bool _isFullscreen = false;
  bool _showControls = true;
  Timer? _hideControlsTimer;

  double _currentPosition = 0.0;
  double _totalDuration = 1.0;

  @override
  void initState() {
    super.initState();

    // ✅ Use asset controller for local videos
    _controller = widget.videoUrl.contains('http')
        ? VideoPlayerController.network(widget.videoUrl)
        : VideoPlayerController.asset(widget.videoUrl);

    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {
        _totalDuration = _controller.value.duration.inSeconds.toDouble();
        _startHideControlsTimer();
        _controller.play(); // Autoplay when ready
        _isPlaying = true;
      });

      _controller.addListener(() {
        if (mounted) {
          setState(() {
            _currentPosition = _controller.value.position.inSeconds.toDouble();
            _isPlaying = _controller.value.isPlaying;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideControlsTimer?.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _hideControlsTimer?.cancel();
      } else {
        _controller.play();
        _startHideControlsTimer();
      }
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1);
    });
  }

  void _toggleFullscreen() {
    setState(() {
      _isFullscreen = !_isFullscreen;
    });
  }

  void _rewind() {
    final current = _controller.value.position;
    _controller.seekTo(Duration(
        seconds: (current.inSeconds - 10).clamp(0, _totalDuration.toInt())));
  }

  void _fastForward() {
    final current = _controller.value.position;
    _controller.seekTo(Duration(
        seconds: (current.inSeconds + 10).clamp(0, _totalDuration.toInt())));
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      if (_controller.value.isPlaying) {
        setState(() {
          _showControls = false;
        });
      }
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isFullscreen ? null : const CustomBackAppBar(),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final currentPosition = _controller.value.position;
            final totalDuration = _controller.value.duration;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _showControls = !_showControls;
                });

                if (_controller.value.isPlaying) {
                  _startHideControlsTimer();
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  if (_showControls)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SafeArea(
                        child: Container(
                          color: Colors.black54,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          _isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: Colors.white,
                                        ),
                                        onPressed: _togglePlayPause,
                                      ),
                                      Text(
                                        "${_formatDuration(currentPosition)} / ${_formatDuration(totalDuration)}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.replay_10,
                                            color: Colors.white),
                                        onPressed: _rewind,
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.forward_10,
                                            color: Colors.white),
                                        onPressed: _fastForward,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          _isMuted
                                              ? Icons.volume_off
                                              : Icons.volume_up,
                                          color: Colors.white,
                                        ),
                                        onPressed: _toggleMute,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          _isFullscreen
                                              ? Icons.fullscreen_exit
                                              : Icons.fullscreen,
                                          color: Colors.white,
                                        ),
                                        onPressed: _toggleFullscreen,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Slider(
                                min: 0.0,
                                max: _totalDuration > 0 ? _totalDuration : 1.0,
                                value: _currentPosition.clamp(0.0,
                                    _totalDuration > 0 ? _totalDuration : 1.0),
                                onChanged: (value) {
                                  _controller
                                      .seekTo(Duration(seconds: value.toInt()));
                                },
                                activeColor: Colors.orange,
                                inactiveColor: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  // Add your "DIFFICULT" text here
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SAMPLE \nLEVEL',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.14,
                          color: appColors.blackText,
                          fontFamily: 'Poppins-semibold',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

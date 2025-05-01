import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:avflex/src/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _controller = VideoPlayerController.asset('assets/videos/final-intro.mp4')
      ..setLooping(true)
      ..setVolume(1.0)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  // Pause/play video based on app lifecycle (optional safety)
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _controller.pause();
    } else if (state == AppLifecycleState.resumed) {
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // 🎥 Video Background
          if (_controller.value.isInitialized)
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),

          // 🧒 Kids images at the bottom
          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.60,
              child: Row(
                children: [
                  Expanded(
                    child: Transform(
                      transform: Matrix4.identity()
                        ..scale(1.6)
                        ..translate(-size.width * 0.01, -size.height * 0.06),
                      child: Image.asset(
                        'assets/images/child-left2.png',
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Transform(
                      transform: Matrix4.identity()
                        ..scale(1.6)
                        ..translate(-size.width * 0.18, -size.height * 0.06),
                      child: Image.asset(
                        'assets/images/child-right2.png',
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🌟 Logo, Text, and Button
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: size.height * 0.1,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/star-icon.png',
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'MAKULAY NA PAGKATUTO PARA SA BAWAT ISA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Opacity(
                      opacity: 0,
                      child: Image.asset('assets/images/home-logo.png'),
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appColors.orangeBg,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                            side: BorderSide(
                              color: appColors.whiteText,
                              width: 2,
                            ),
                          ),
                        ),
                        onPressed: () {
                          _controller.pause(); // Stop audio before navigating
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CategoryScreen()),
                          ).then((_) {
                            // Resume video when coming back
                            if (mounted) {
                              _controller.play();
                            }
                          });
                        },
                        child: const Text(
                          'MAGSIMULA',
                          style: TextStyle(
                            fontFamily: 'Poppins-semibold',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

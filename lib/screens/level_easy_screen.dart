import 'package:avflex/screens/video_player_screen.dart';
import 'package:avflex/src/colors.dart';
import 'package:avflex/widget/box-card.dart';
import 'package:flutter/material.dart';
import '../widget/custom-appbar.dart';

class LevelEasyScreen extends StatelessWidget {
  const LevelEasyScreen({Key? key}) : super(key: key);

  void navigateToVideo(BuildContext context, String videoUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomVideoPlayerScreen(videoUrl: videoUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double screenWidth = size.width;

    return Scaffold(
        appBar: const CustomBackAppBar(),
        body: SizedBox.expand(
            child: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/category-bg.png'), // Your image
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Container(
            color: Colors.white.withOpacity(0.6),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to left
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'EASY',
                    style: TextStyle(
                      fontSize: screenWidth * 0.14,
                      color: appColors.blackText,
                      fontFamily: 'Poppins-semibold',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 0),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'LEVEL',
                    style: TextStyle(
                      fontSize: screenWidth * 0.14,
                      color: appColors.blackText,
                      fontFamily: 'Poppins-semibold',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 0),

                // Centered Buttons
                Center(
                  child: Column(children: [
                    buildCard(
                        context: context,
                        imagePath: 'assets/images/easy-alphabets-icon.png',
                        label: 'FILIPINO SIGN LANGUAGE\nALPHABET (A-Z)',
                        onTap: () => navigateToVideo(
                            context, 'assets/videos/sample-vid.mp4'),
                        reverse: true,
                        alignTextRight: false,
                        bgColor: appColors.yellowBg),
                    const SizedBox(height: 10),
                    buildCard(
                        context: context,
                        imagePath: 'assets/images/easy-numbers-icon.png',
                        label: 'FILIPINO SIGN LANGUAGE\nNUMBERS (0-9)',
                        onTap: () => navigateToVideo(
                            context, 'assets/videos/sample-vid.mp4'),
                        reverse: false,
                        alignTextRight: true,
                        zoomImage: true,
                        bgColor: appColors.yellowBg),
                    const SizedBox(height: 10),
                  ]),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'ALPHABETS & NUMBERS',
                    style: TextStyle(
                      fontSize: 12,
                      color: appColors.blueText,
                      fontFamily: 'Poppins-semibold',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}

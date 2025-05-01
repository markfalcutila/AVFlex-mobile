import 'package:avflex/src/colors.dart';
import 'package:avflex/widget/box-card.dart';
import 'package:flutter/material.dart';
import '../widget/custom-appbar.dart';
import 'video_player_screen.dart';

class LevelAverageScreen extends StatelessWidget {
  const LevelAverageScreen({Key? key}) : super(key: key);

  void navigateToVideo(BuildContext context, String videoUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomVideoPlayerScreen(
          videoUrl: videoUrl,
          labelText: 'AVERAGE LEVEL', // <- Dynamic text for this page
          labelFooterText: 'BASIC WORDS & PHRASES',
          boxColor: appColors.orangeBg, // <- Dynamic color for this page
        ),
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
                    'AVERAGE',
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
                        imagePath:
                            'assets/images/average-classroom-convo-icon.png',
                        label:
                            'FILIPINO SIGN LANGUAGE \nESSENTIAL CLASSROOM CONVERSATION \nIN SNED',
                        onTap: () => navigateToVideo(
                            // context, 'assets/videos/ALPHABET.mp4'),
                            context,
                            'assets/videos/GREETINGS_ESSENTIAL_IN_SNED.mp4'),
                        reverse: true,
                        alignTextRight: false,
                        imageFlex: 4,
                        textFlex: 6,
                        zoomImage: true,
                        bgColor: appColors.orangeBg),
                    const SizedBox(height: 10),
                    buildCard(
                        context: context,
                        imagePath: 'assets/images/average-emotions-icon.png',
                        label: 'FILIPINO SIGN LANGUAGE\n EMOTIONS \n(0-9)',
                        onTap: () => navigateToVideo(
                            // context, 'assets/videos/ALPHABET.mp4'),
                            context,
                            'assets/videos/EMOTIONS.mp4'),
                        reverse: false,
                        alignTextRight: true,
                        bgColor: appColors.orangeBg),
                    const SizedBox(height: 10),
                  ]),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'BASIC WORDS & PHRASES',
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

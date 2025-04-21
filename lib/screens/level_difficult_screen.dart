import 'package:avflex/screens/video_player_screen.dart';
import 'package:avflex/src/colors.dart';
import 'package:avflex/widget/box-card.dart';
import 'package:flutter/material.dart';
import '../widget/custom-appbar.dart';

class LevelDifficultScreen extends StatelessWidget {
  const LevelDifficultScreen({Key? key}) : super(key: key);

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
      body: Container(
        color: Colors.white.withOpacity(0.6),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'DIFFICULT',
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
              Center(
                child: Column(
                  children: [
                    buildCard(
                      context: context,
                      imagePath: 'assets/images/difficult-math.png',
                      label: 'FILIPINO SIGN LANGUAGE \nESSENTIAL MATH',
                      onTap: () => navigateToVideo(
                        context,
                        'assets/videos/sample-vid.mp4',
                      ),
                      reverse: true,
                      alignTextRight: false,
                      bgColor: appColors.violetBg,
                    ),
                    const SizedBox(height: 10),
                    buildCard(
                      context: context,
                      imagePath: 'assets/images/difficult-science.png',
                      label: 'FILIPINO SIGN LANGUAGE\n SCIENCE',
                      onTap: () => navigateToVideo(
                        context,
                        'assets/videos/sample-vid.mp4',
                      ),
                      reverse: false,
                      alignTextRight: true,
                      zoomImage: true,
                      scaleImage: 1.2,
                      offset: Offset(20, -10),
                      bgColor: appColors.violetBg,
                    ),
                    const SizedBox(height: 10),
                    buildCard(
                      context: context,
                      imagePath: 'assets/images/difficult-english-icon.png',
                      label: 'FILIPINO SIGN LANGUAGE \nBASIC \nENGLISH',
                      onTap: () => navigateToVideo(
                        context,
                        'assets/videos/sample-vid.mp4',
                      ),
                      reverse: true,
                      alignTextRight: false,
                      bgColor: appColors.violetBg,
                      // zoomImage: true,
                      // scaleImage: 1.8,
                    ),
                    const SizedBox(height: 10),
                    buildCard(
                      context: context,
                      imagePath: 'assets/images/difficult-body-sounds-icon.png',
                      label: 'FILIPINO SIGN LANGUAGE\nBODY \nSOUNDS',
                      onTap: () => navigateToVideo(
                        context,
                        'assets/videos/sample-vid.mp4',
                      ),
                      reverse: false,
                      alignTextRight: true,
                      // zoomImage: true,
                      // scaleImage: 1.2,
                      offset: Offset(20, -10),
                      bgColor: appColors.violetBg,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
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
      ),
    );
  }
}

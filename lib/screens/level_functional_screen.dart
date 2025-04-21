import 'package:avflex/src/colors.dart';
import 'package:flutter/material.dart';
import '../widget/box-card.dart';
import '../widget/custom-appbar.dart';
import 'video_player_screen.dart';

class LevelFunctionalScreen extends StatelessWidget {
  const LevelFunctionalScreen({Key? key}) : super(key: key);

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
          color: Colors.white.withOpacity(0.6),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'FUNCTIONAL',
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
                    imagePath: 'assets/images/functional-level-icon.png',
                    label: 'FILIPINO SIGN LANGUAGE\nINTERACTIONS',
                    onTap: () => navigateToVideo(
                        context, 'assets/videos/sample-vid.mp4'),
                    reverse: true,
                    alignTextRight: false,
                    bgColor: appColors.greenBg,
                    boxHeight: 0.55,
                    zoomImage: true,
                    scaleImage: 1.6,
                    offset: Offset(-80, 0),
                  ),
                  const SizedBox(height: 10),
                ]),
              ),

              Align(
                alignment: Alignment.center,
                child: Text(
                  'FUNCTIONAL ADVANCE LEVEL',
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
        )));
  }
}

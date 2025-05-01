import 'package:avflex/src/colors.dart';
import 'package:flutter/material.dart';
import '../widget/custom-appbar.dart';
import 'level_easy_screen.dart';
import 'level_average_screen.dart';
import 'level_difficult_screen.dart';
import 'level_functional_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  void navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height; // Get the screen height

    return Scaffold(
      appBar: const CustomBackAppBar(
        isTransparent: true,
      ),
      extendBodyBehindAppBar: true, // Let the body extend behind the app bar
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/category-bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.white.withOpacity(0.6),
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
              top:
                  100, // Adjust this padding value to give enough space below the app bar
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome to AVFlex',
                      style: TextStyle(
                        fontSize: screenWidth * 0.14,
                        color: appColors.blueText,
                        fontFamily: 'Poppins-semibold',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enhancing communication through Filipino Sign Language (FSL)',
                      style: TextStyle(
                        fontSize: screenWidth * 0.040,
                        color: appColors.blueText,
                        fontFamily: 'Poppins-semibold',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'PICK LEVELS',
                      style: TextStyle(
                        fontSize: screenWidth * 0.040,
                        color: appColors.blueText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Category Box (height = 50% of screen height)
                  Container(
                    height: screenHeight * 0.5, // 50% of the screen height
                    child: Center(
                      child: Column(
                        children: [
                          buildButton(
                            context,
                            screenWidth: screenWidth,
                            color: appColors.yellowBg,
                            borderColor: appColors.yellowText,
                            textColor: appColors.yellowText,
                            text: 'EASY',
                            screen: const LevelEasyScreen(),
                          ),
                          const SizedBox(height: 16),
                          buildButton(
                            context,
                            screenWidth: screenWidth,
                            color: appColors.orangeBg,
                            borderColor: appColors.orangeText,
                            textColor: appColors.orangeText,
                            text: 'AVERAGE',
                            screen: const LevelAverageScreen(),
                          ),
                          const SizedBox(height: 16),
                          buildButton(
                            context,
                            screenWidth: screenWidth,
                            color: appColors.violetBg,
                            borderColor: appColors.violetText,
                            textColor: appColors.violetText,
                            text: 'DIFFICULT',
                            screen: const LevelDifficultScreen(),
                          ),
                          const SizedBox(height: 16),
                          buildButton(
                            context,
                            screenWidth: screenWidth,
                            color: appColors.greenBg,
                            borderColor: appColors.greenText,
                            textColor: appColors.greenText,
                            text: 'FUNCTIONAL',
                            screen: const LevelFunctionalScreen(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(
    BuildContext context, {
    required double screenWidth,
    required Color color,
    required Color borderColor,
    required Color textColor,
    required String text,
    required Widget screen,
  }) {
    return SizedBox(
      width: screenWidth * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(color: borderColor, width: 2),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => screen),
          );
        },
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins-semibold',
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

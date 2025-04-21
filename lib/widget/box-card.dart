import 'package:avflex/src/colors.dart';
import 'package:flutter/material.dart';

Widget buildCard({
  required BuildContext context,
  required String label,
  required String imagePath,
  required VoidCallback onTap,
  bool reverse = false,
  bool alignTextRight = false,
  bool zoomImage = false,
  double scaleImage = 1.3,
  int textFlex = 4, // default value
  int imageFlex = 6, // default value
  required Color bgColor,
  Offset offset = const Offset(0, 0),
  double boxHeight = 0.28,
}) {
  final screenSize = MediaQuery.of(context).size;
  final cardHeight = screenSize.height * boxHeight;
  double screenWidth = screenSize.width;

  final imageWidget = Expanded(
    flex: imageFlex,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Bottom shadow
        Positioned(
          bottom: 0,
          child: Container(
            width: 100,
            height: 20,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ),
        // Image with optional zoom
        zoomImage
            ? Transform.translate(
                offset: offset,
                child: Transform.scale(
                  scale: scaleImage,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            : Image.asset(
                imagePath,
                fit: BoxFit.fitHeight,
              ),
      ],
    ),
  );

  final textAndIcon = Expanded(
    flex: textFlex,
    child: Column(
      crossAxisAlignment:
          alignTextRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          textAlign: alignTextRight ? TextAlign.right : TextAlign.left,
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 10),
        const Icon(
          Icons.play_circle_outline,
          size: 25,
          color: Colors.black87,
        ),
      ],
    ),
  );

  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: cardHeight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          // color: appColors.yellowBg,
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children:
              reverse ? [textAndIcon, imageWidget] : [imageWidget, textAndIcon],
        ),
      ),
    ),
  );
}

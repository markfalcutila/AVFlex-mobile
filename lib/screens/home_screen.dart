import 'package:avflex/src/colors.dart';
import 'package:flutter/material.dart';

import 'category_screen.dart'; // If using SVGs
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient or Image
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [Color(0xFFFFE0F0), Color(0xFFFDD9F5)],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              // ),
              // or use background image:
              image: DecorationImage(
                image: AssetImage('assets/images/home-bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Kids at the bottom
          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.45,
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/kids-left.png',
                      fit: BoxFit.fitHeight, // 👈 fill instead of fitHeight
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/kids-right.png',
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: size.height * 0.2, // leave space at the bottom for the kids
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Row for the Star Icon aligned to the left
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .start, // Aligns the star to the left
                      children: [
                        Image.asset(
                          'assets/images/star-icon.png',
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Text
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

                    // AVFlex Logo
                    Image.asset(
                      'assets/images/home-logo.png',
                      width: size.width * 0.7,
                    ),
                    const SizedBox(height: 24),

                    // Button
                    SizedBox(
                      width: size.width * 0.5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: appColors
                              .orangeBg, // Button background color (optional)
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(24), // Border radius
                            side: BorderSide(
                                color: appColors.whiteText,
                                width: 2), // Border color and width
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CategoryScreen()),
                          );
                        },
                        child: const Text(
                          'MAGSIMULA',
                          style: TextStyle(
                            fontFamily:
                                'Poppins-semibold', // Set font to Poppins
                            fontSize:
                                16, // You can adjust the font size as needed
                            fontWeight: FontWeight
                                .w600, // Optional: set the font weight
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

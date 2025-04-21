import 'package:flutter/material.dart';
import 'package:avflex/src/colors.dart';

class CustomBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomBackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: appColors.whiteText,
      leadingWidth: 110, // Enough space for icon + text
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
              SizedBox(width: 4),
              Text(
                'Back',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

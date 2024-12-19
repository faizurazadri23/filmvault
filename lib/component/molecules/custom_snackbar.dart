import 'package:flutter/material.dart';

import '../atom/custom_text.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.blue, // Default color
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomText.textBold12(
            context: context, text: message, textColor: Colors.white),
        backgroundColor: backgroundColor, // Custom background color
        duration: duration,
      ),
    );
  }

  static void showTop(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.blue,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0, // Atur jarak dari atas
        left: 16.0,
        right: 16.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CustomText.textBold12(
                context: context, text: message, textColor: Colors.white),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Hapus snackbar setelah durasi selesai
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}

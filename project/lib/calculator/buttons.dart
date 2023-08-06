import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Color color; // Added the type annotation 'Color'
  final Color textColor; // Added the type annotation 'Color'
  final String buttonText;
  final VoidCallback? buttontapped; // Used 'VoidCallback' for the function type

  const Buttons({
    Key? key,
    required this.color,
    required this.textColor,
    required this.buttonText,
    this.buttontapped,
  }) : super(key: key); // Moved 'key' to the constructor and added 'super'

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: buttontapped,
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

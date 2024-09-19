import 'package:flutter/material.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({super.key, required this.onPressed, required this.title, this.height});
  final VoidCallback onPressed;
  final String title;
  final double ? height;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize:  Size.fromHeight(height ?? 70)
      ),
      child: Text(title),
    );
  }
}
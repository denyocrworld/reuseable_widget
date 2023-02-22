// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class QTextField extends StatefulWidget {
  final String label;
  final IconData? suffixIcon;
  final Function(String) onSubmitted;
  final bool? obscureText;

  const QTextField({
    Key? key,
    required this.label,
    required this.onSubmitted,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(
          Radius.circular(
            6.0,
          ),
        ),
        border: Border.all(
          width: 1.0,
          color: Colors.grey,
        ),
      ),
      child: Center(
        child: TextField(
          obscureText: widget.obscureText!,
          style: TextStyle(
            color: Colors.grey[600],
          ),
          decoration: InputDecoration(
            hintText: widget.label,
            suffixIcon: Icon(
              widget.suffixIcon ?? Icons.font_download,
              color: Colors.grey[600],
            ),
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          onSubmitted: (value) {
            widget.onSubmitted(value);
          },
        ),
      ),
    ).animate().fade().shake();
  }
}

/*
Junior Front End
(Wajib)
- Bikin UI
- Consume API

---
Clone 5 UI dari Aplikasi Populer
- Tokopedia, Tiktok, Netflix, dll

Clone 5 UI dari dribbble

Buat 1 aplikasi yang ada API-nya.


11 Portofolio
---

(Optional)
Deployment
Testing
Architecture
*/
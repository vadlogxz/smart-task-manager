import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const LabeledTextField({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextFormField(
          controller: controller,
        ),
      ],
    );
  }
}

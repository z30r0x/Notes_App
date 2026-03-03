import 'package:flutter/material.dart';

class TitleTextFormField extends StatelessWidget {
  const TitleTextFormField({super.key, required this.titleController});

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Title',
        hintStyle: const TextStyle(color: Colors.white54),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Title cannot be empty';
        }
        return null;
      },
    );
  }
}

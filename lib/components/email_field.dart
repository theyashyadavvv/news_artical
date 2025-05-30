import 'package:flutter/material.dart';
import 'package:news_buzz/components/custom_text.dart';
import 'package:news_buzz/constants/k_validators.dart';

class EmailField extends StatelessWidget {
  final TextEditingController textController;
  const EmailField({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: kEmailValidator,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter email Id',
        label: CustomText('Email'),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

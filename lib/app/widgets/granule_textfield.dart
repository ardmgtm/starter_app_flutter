import 'package:flutter/material.dart';

class GranuleTextfield extends StatelessWidget {
  final String label;
  final bool obscureText;
  final String? placeholder;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;

  const GranuleTextfield({
    super.key,
    required this.label,
    this.obscureText = false,
    this.placeholder,
    this.controller,
    this.onFieldSubmitted,
    this.focusNode,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          onFieldSubmitted: onFieldSubmitted,
          focusNode: focusNode,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            fillColor: Colors.grey,
            isDense: true,
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color.fromRGBO(225, 230, 237, 1),
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color.fromRGBO(225, 230, 237, 1),
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  const TextInputField({
    super.key,
    this.controller,
    this.inputFormatters,
    this.prefix,
    this.keyboardType,
    this.focusNode,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white,
        fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold).fontFamily,
      ),
      decoration: InputDecoration(prefix: prefix),
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      focusNode: focusNode,
    );
  }
}

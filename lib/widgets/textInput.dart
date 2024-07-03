import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housing_information_website/themes/theme.dart';

class textInput extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)?  validation;
  final String hinty;
  final IconData icon;
  final bool obscureText;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;

  const textInput({
    super.key,
    required this.controller,
    required this.hinty,
    required this.icon,
    required this.obscureText,
    required this.textInputType,
    required this.textCapitalization,
    required this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
            border: Border.all(
              color: lRed,
              width: .5,
            )
        ),
        child: TextFormField(
          validator: validation,
          obscureText: obscureText,
          obscuringCharacter: '*',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: Colors.grey[800]
          ),
          keyboardType: textInputType,
          textCapitalization: textCapitalization,
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: lRed,
              ),
              suffixIcon: IconButton(
                hoverColor: pRed,
                highlightColor: lRed,
                onPressed: () {
                  controller.clear();
                },
                icon:  Icon(
                  Icons.clear_outlined,
                  color: lRed,
                ),
              ),
              hintText: hinty,
              hintStyle:  GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[800]
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class ValidatedTextFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final String? Function(String?)? validator;

//   ValidatedTextFormField({
//     required this.controller,
//     required this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       validator: validator,
//     );
//   }
// }

import 'package:flutter/material.dart';

class ValidatedTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  //

  final String hintText;
  final String labelText;
  // final String initialValue;
  final bool enablePasswordEyeIcon;
  final bool enablePasswordHideText;
  final String? Function(String?)? passwordEyeOnPressed;
  final String? Function(String?)? onChange;
  final Color defaultBorderColor;
  final Color defaultTextColor;
  final bool readOnly;

  ValidatedTextFormField({
    required this.controller,
    this.validator,
    // this.keyboardType,
    required this.hintText,
    required this.labelText,
    // required this.initialValue,
    this.enablePasswordEyeIcon = false,
    this.enablePasswordHideText = false,
    this.passwordEyeOnPressed,
    this.onChange,
    this.defaultBorderColor = Colors.black,
    this.defaultTextColor = Colors.black,
    this.readOnly = false,
    // this.defaultColor ThemeData(color:Colors.white),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    // required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // initialValue: initialValue,
      controller: controller,
      onChanged: onChange,
      validator: validator,
      style: TextStyle(color: this.defaultTextColor),
      // keyboardType: keyboardType,
      autocorrect: false,
      obscureText: enablePasswordHideText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: TextStyle(color: this.defaultTextColor),
        labelStyle: TextStyle(color: this.defaultTextColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: this.defaultBorderColor),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: this.defaultBorderColor),
          borderRadius: BorderRadius.circular(18),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: this.defaultBorderColor),
          borderRadius: BorderRadius.circular(18),
        ),
        suffixIcon: enablePasswordEyeIcon
            ? IconButton(
                icon: enablePasswordHideText
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.black,
                      ),
                iconSize: 20.0,
                onPressed: () {
                  passwordEyeOnPressed;
                })
            : null,
      ),
    );
  }
}

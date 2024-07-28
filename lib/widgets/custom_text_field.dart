import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.icon,
    this.isPassword = false,
    this.onChange,
  });

  final String? hintText;
  final IconData? icon;
  final bool isPassword;
  final Function(String?)? onChange;

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
      },
      onChanged: widget.onChange,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        prefixIcon: widget.icon != null ? Icon(widget.icon, size: 20) : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? EneftyIcons.eye_slash_outline
                      : EneftyIcons.eye_outline,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        filled: true,
        fillColor: Theme.of(context).cardTheme.color,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // Updated to 15
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // Updated to 15
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // Updated to 15
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(15), // Updated to 15
        ),
      ),
    );
  }
}

import 'package:billy/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData prefixIcon;
  final String label;
  final String? hintTitle;
  final String? errorText;
  final String? Function(String? value)? onSave;

  const CustomTextField({Key? key, required this.label,this.hintTitle,required this.prefixIcon,required this.errorText,required this.onSave}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppTheme.lightPrimaryColor,
      decoration: InputDecoration(
        errorMaxLines: 2,
        filled: true,
        errorText: widget.errorText,
        hintText: widget.hintTitle,
        labelText: widget.label,
        focusColor: AppTheme.lightPrimaryColor,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(widget.prefixIcon),
      ),
      onSaved: widget.onSave == null ? null : (v) => widget.onSave!(v),
    );
  }
}

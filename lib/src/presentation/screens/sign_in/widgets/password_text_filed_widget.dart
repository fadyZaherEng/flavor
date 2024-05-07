import 'package:flavor/flavors.dart';
import 'package:flavor/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelTitle;
  final String? errorMessage;
  final Function(String) onChange;
  final TextInputType textInputType;

  const PasswordTextFieldWidget({
    Key? key,
    required this.controller,
    required this.labelTitle,
    required this.onChange,
    this.errorMessage,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool _showPassword = true;
  IconData _passwordIcon = Icons.remove_red_eye_outlined;
  final FocusNode _focus = FocusNode();
  bool _textFieldHasFocus = false;

  @override
  void initState() {
    _focus.addListener(() {
      setState(() {
        _textFieldHasFocus = _focus.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focus,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      onChanged: widget.onChange,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: widget.errorMessage != null
              ? ColorSchemes.redError
              : !F.isProduction
                  ? ColorSchemes.white
                  : ColorSchemes.black,
          letterSpacing: -0.13),
      obscureText: _showPassword,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: !F.isProduction ? ColorSchemes.white : ColorSchemes.black,
            ),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: !F.isProduction ? ColorSchemes.white : ColorSchemes.black,
            ),
            borderRadius: BorderRadius.circular(12)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorSchemes.redError),
            borderRadius: BorderRadius.circular(12)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: !F.isProduction ? ColorSchemes.white : ColorSchemes.black,
            ),
            borderRadius: BorderRadius.circular(12)),
        errorText: widget.errorMessage,
        labelText: widget.labelTitle,
        suffixIcon: IconButton(
          icon: Icon(
            _passwordIcon,
            color: F.isProduction ? ColorSchemes.logo : ColorSchemes.primary,
          ),
          onPressed: _toggleVisibilityIcon,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        labelStyle: _labelStyle(context, _textFieldHasFocus),
        errorMaxLines: 2,
      ),
    );
  }

  void _toggleVisibilityIcon() {
    setState(() {
      _showPassword = !_showPassword;
      if (_showPassword) {
        _passwordIcon = Icons.remove_red_eye_outlined;
      } else {
        _passwordIcon = Icons.remove_red_eye;
      }
    });
  }

  TextStyle _labelStyle(BuildContext context, bool hasFocus) {
    if (hasFocus || widget.controller.text.isNotEmpty) {
      return Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: widget.errorMessage == null
                ? ColorSchemes.gray
                : ColorSchemes.redError,
            letterSpacing: -0.13,
          );
    } else {
      return Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: widget.errorMessage == null
                ? ColorSchemes.gray
                : ColorSchemes.redError,
            letterSpacing: -0.13,
          );
    }
  }

  @override
  void deactivate() {
    _focus.dispose();
    super.deactivate();
  }
}

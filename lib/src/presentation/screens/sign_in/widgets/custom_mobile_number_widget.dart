import 'package:flavor/flavors.dart';
import 'package:flavor/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomMobileNumberWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelTitle;
  final String? errorMessage;
  final double? height;
  final void Function(String phoneNumber) onChange;
  final Function()? onSubmitted;
  final TextInputType textInputType;
  final TextAlignVertical? textAlignVertical;
  final List<TextInputFormatter>? inputFormatters;
  final bool isReadOnly;
  final String initialValue;

  const CustomMobileNumberWidget({
    Key? key,
    required this.controller,
    required this.labelTitle,
    required this.onChange,
    this.errorMessage,
    this.height = 1,
    this.textInputType = TextInputType.text,
    this.textAlignVertical,
    this.inputFormatters,
    this.isReadOnly = false,
    this.onSubmitted,
    this.initialValue = "",
  }) : super(key: key);

  @override
  State<CustomMobileNumberWidget> createState() =>
      _CustomMobileNumberWidgetState();
}

class _CustomMobileNumberWidgetState extends State<CustomMobileNumberWidget> {
  final FocusNode _focus = FocusNode();
  bool _textFieldHasFocus = false;
  bool isValueChanged = false;

  String phoneNumber = "";

  @override
  void initState() {
    phoneNumber = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextField(
        focusNode: _focus,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          FilteringTextInputFormatter.allow(RegExp(r'^(?!0)\d*$')),
        ],
        onChanged: (phone) {
          isValueChanged = true;
          phoneNumber = phone;
        },
        keyboardType: TextInputType.phone,
        // ignore: deprecated_member_use
        controller: widget.controller,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            height: widget.height,
            color: !F.isProduction ? ColorSchemes.white : ColorSchemes.black,
            letterSpacing: -0.13),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    !F.isProduction ? ColorSchemes.white : ColorSchemes.black,
              ),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    !F.isProduction ? ColorSchemes.white : ColorSchemes.black,
              ),
              borderRadius: BorderRadius.circular(12)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorSchemes.redError),
              borderRadius: BorderRadius.circular(12)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    !F.isProduction ? ColorSchemes.white : ColorSchemes.black,
              ),
              borderRadius: BorderRadius.circular(12)),
          errorText: widget.errorMessage,
          labelText: widget.labelTitle,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          labelStyle: _labelStyle(context, _textFieldHasFocus),
          errorMaxLines: 2,
          hintStyle: TextStyle(
            color: ColorSchemes.gray,
            height: widget.height,
            letterSpacing: -0.13,
          ),
        ),
      ),
    );
  }

  TextStyle _labelStyle(BuildContext context, bool hasFocus) {
    return Theme.of(context).textTheme.titleSmall!.copyWith(
          color: widget.errorMessage == null
              ? ColorSchemes.gray
              : ColorSchemes.redError,
          letterSpacing: -0.13,
        );
  }
}

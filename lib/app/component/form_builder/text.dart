import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/app/component/form_builder/impl/text_validate_impl.dart';
import 'package:mobile/app/config/form_builder/form_config.dart';
import 'package:mobile/app/data/theme/theme.dart';

class TextFieldValidate extends StatefulWidget {
  final String name;
  final List<ValidatorEnum>? validator;
  final Color? fillColor;
  final bool? filled;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final bool showErrorText;
  final bool autoFocus;
  final bool readOnly;
  final TextInputType? keyboardType;
  final ValueChanged<String?>? onChanged;
  final String? errorText;
  final VoidCallback? onReset;
  final VoidCallback? onTap;
  final FormFieldSetter<String>? onSave;
  final ValueChanged<String?>? onSubmit;
  final List<int>? stringLength;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final int? maxLines;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final String? initialValue;

  const TextFieldValidate({
    Key? key,
    required this.name,
    this.onEditingComplete,
    required this.validator,
    this.fillColor,
    this.filled,
    this.prefixIconConstraints,
    this.prefixIcon,
    this.labelText,
    this.hintText,
    this.textInputAction,
    this.obscureText = false,
    this.suffixIcon,
    this.showErrorText = false,
    this.readOnly = false,
    this.inputFormatters,
    this.keyboardType,
    this.suffixIconConstraints,
    this.autoFocus = false,
    this.onChanged,
    this.errorText,
    this.onReset,
    this.onTap,
    this.onSave,
    this.onSubmit,
    this.stringLength,
    this.onFocusChange,
    this.focusNode,
    this.controller,
    this.maxLines,
    this.hintStyle,
    this.initialValue,
  }) : super(key: key);

  @override
  State<TextFieldValidate> createState() => _TextFieldValidateState();
}

class _TextFieldValidateState extends State<TextFieldValidate> {
  final TextFieldValidateImpl _textFieldValidateImpl = TextFieldValidateImpl();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.readOnly,
      // child: FormBuilderTextField(
      //   name: widget.name,
      //   initialValue: widget.initialValue,
      //   controller: widget.controller,
      //   validator: FormBuilderValidators.compose(_textFieldValidateImpl.listValidate(widget.validator, context)),
      //   onChanged: widget.onChanged,
      //   inputFormatters: widget.inputFormatters,
      //   textInputAction: widget.textInputAction,
      //   onEditingComplete: widget.onEditingComplete,
      //   obscureText: widget.obscureText,
      //   autofocus: widget.autoFocus,
      //   style: titleTextStyle.copyWith(color: CustomColor.regularText),
      //   keyboardType: widget.keyboardType,
      //   onReset: widget.onReset,
      //   onTap: widget.onTap,
      //   onSaved: widget.onSave,
      //   onSubmitted: widget.onSubmit,
      //   expands: false,
      //   maxLines: widget.maxLines ?? 1,
      //   decoration: InputDecoration(
      //     errorStyle: TextStyle(
      //         fontSize: SizeText.size12,
      //         color: Colors.red,
      //         fontWeight: FontWeight.w400,
      //         decorationThickness: 0,
      //         height: 1),
      //     errorText: widget.errorText,
      //     fillColor: widget.fillColor ?? Colors.white,
      //     filled: widget.filled ?? true,
      //     prefixIconConstraints: widget.prefixIconConstraints,
      //     prefixIcon: widget.prefixIcon,
      //     suffixIcon: widget.suffixIcon,
      //     suffixIconConstraints: widget.suffixIconConstraints,
      //     contentPadding: contentPaddingStyle(),
      //     border: borderStyle(),
      //     enabledBorder: borderStyle(),
      //     focusedBorder: borderStyle(),
      //     alignLabelWithHint: true,
      //     labelText: widget.labelText,
      //     labelStyle: titleTextStyle,
      //     hintText: widget.hintText,
      //     hintStyle: widget.hintStyle ?? titleTextStyle.copyWith(color: CustomColor.blurredLetters),
      //   ),
      // ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/resources.dart';

class InputText extends StatefulWidget {
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final Function(String)? validator;
  final String? errorText;
  final Function(String)? onChanged;
  final Function? onTap;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? minLine;
  final int? maxLine;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final bool? enable;
  final List<TextInputFormatter>? inputFormatter;
  final bool isHintVisible;
  final Widget prefixIcon;
  final String? prefixText;
  final String? labelText;
  final String? hintText;
  final Iterable<String>? autofillHints;
  final VoidCallback? onEditingComplete;

  const InputText({
    super.key,
    this.currentFocusNode,
    this.nextFocusNode,
    this.validator,
    this.errorText,
    this.onChanged,
    this.keyboardType,
    this.textCapitalization,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.onTap,
    this.textAlign,
    this.enable,
    this.inputFormatter,
    this.minLine,
    this.maxLine,
    required this.prefixIcon,
    this.isHintVisible = true,
    this.prefixText,
    this.labelText,
    this.hintText,
    this.autofillHints,
    this.onEditingComplete,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      child: TextFormField(
        key: widget.key,
        autofillHints: widget.autofillHints,
        enabled: widget.enable,
        obscureText: widget.obscureText ?? false,
        focusNode: widget.currentFocusNode,
        keyboardType: widget.keyboardType,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        textAlign: widget.textAlign ?? TextAlign.start,
        minLines: widget.minLine ?? 1,
        maxLines: widget.maxLine ?? 10,
        inputFormatters: widget.inputFormatter,
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context).textTheme.bodyMedium,
        cursorColor: Palette.text,
        decoration: InputDecoration(
          prefixText: widget.prefixText,
          alignLabelWithHint: true,
          isDense: true,
          labelText: widget.labelText,
          hintText: widget.hintText,
          errorText: widget.errorText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Palette.disable),
          suffixIcon: widget.suffixIcon,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.space12),
            child: widget.prefixIcon,
          ),
          prefixIconConstraints: BoxConstraints(
            minHeight: Dimens.space24,
            maxHeight: Dimens.space24,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: Dimens.space12,
            horizontal: Dimens.space16,
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(Dimens.space4),
            borderSide: const BorderSide(color: Palette.disable),
          ),
          disabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(Dimens.space4),
            borderSide: const BorderSide(color: Palette.disable),
          ),
          errorStyle: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: Palette.red),
          focusedErrorBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(Dimens.space4),
            borderSide: const BorderSide(color: Palette.red),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(Dimens.space4),
            borderSide: const BorderSide(color: Palette.red),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(Dimens.space4),
            borderSide: const BorderSide(color: Palette.primary),
          ),
        ),
        validator: widget.validator as String? Function(String?)?,
        onChanged: widget.onChanged,
        onTap: widget.onTap as void Function()?,
        onFieldSubmitted: (value) {
          setState(() {
            fieldFocusChange(
              context,
              widget.currentFocusNode ?? FocusNode(),
              widget.nextFocusNode,
            );
          });
        },
        onEditingComplete: widget.onEditingComplete,
      ),
    );
  }

  void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode? nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

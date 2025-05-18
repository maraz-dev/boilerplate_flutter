import 'package:boilerplate_flutter/view/theme/app_colors.dart';
import 'package:boilerplate_flutter/view/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputField extends StatefulWidget {
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String? header;
  final String hint;
  final bool readOnly;
  final bool obscureText;
  final bool autoCorrect;
  final Function()? onPressed;
  final Function(String)? onChanged;
  final int? maxLength;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon, suffixIcon;
  const TextInputField({
    super.key,
    required this.controller,
    required this.hint,
    required this.inputType,
    this.textInputAction = TextInputAction.next,
    required this.validator,
    this.maxLength,
    this.autoCorrect = false,
    this.obscureText = false,
    this.readOnly = false,
    this.onPressed,
    this.header,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.inputFormatters,
    this.onChanged,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.header != null) ...[
          Text(
            widget.header ?? "",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColors.kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
          ),
          12.0.height,
        ],
        TextFormField(
          autocorrect: widget.autoCorrect,
          controller: widget.controller,
          keyboardType: widget.inputType,
          textInputAction: widget.textInputAction,
          maxLength: widget.maxLength,
          cursorColor: AppColors.kPrimaryColor,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: widget.obscureText,
          obscuringCharacter: '●',
          validator: widget.validator,
          readOnly: widget.readOnly,
          onTap: widget.onPressed,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          inputFormatters: widget.inputFormatters,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.kPrimaryColor),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle:
                Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.kHintColor),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
          ),
        )
      ],
    );
  }
}

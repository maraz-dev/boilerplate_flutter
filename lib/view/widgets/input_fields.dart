// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:boilerplate_flutter/view/theme/app_colors.dart';
// import 'package:boilerplate_flutter/view/utils/extensions.dart';

// class TextInputField extends StatelessWidget {
//   final TextInputType inputType;
//   final String? Function(String?)? validator;
//   final TextEditingController controller;
//   final String? header;
//   final String hint;
//   final bool readOnly;
//   final bool animate;
//   final Function()? onPressed;
//   final Function(String)? onChanged;
//   final int? maxLength;
//   final int? maxLines;
//   final List<TextInputFormatter>? inputFormatters;
//   final Widget? prefixIcon, suffixIcon;
//   const TextInputField({
//     super.key,
//     required this.controller,
//     required this.hint,
//     required this.inputType,
//     required this.validator,
//     this.maxLength,
//     this.readOnly = false,
//     this.onPressed,
//     this.header,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.maxLines,
//     this.inputFormatters,
//     this.animate = true,
//     this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Animate(
//       effects: animate
//           ? [
//               FadeEffect(
//                 begin: 0,
//                 delay: 200.ms,
//               ),
//               const SlideEffect(
//                 begin: Offset(0, .5),
//                 end: Offset(0, 0),
//               )
//             ]
//           : [],
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (header != null) ...[
//             Text(
//               header ?? "",
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium!
//                   .copyWith(color: AppColors.kGrey700, fontWeight: FontWeight.bold),
//             ),
//             6.0.height,
//           ],
//           TextFormField(
//             controller: controller,
//             keyboardType: inputType,
//             maxLength: maxLength,
//             cursorColor: AppColors.kGrey700,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             validator: validator,
//             readOnly: readOnly,
//             onTap: onPressed,
//             onChanged: onChanged,
//             maxLines: maxLines,
//             inputFormatters: inputFormatters,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyMedium!
//                 .copyWith(color: AppColors.kGrey700, fontWeight: FontWeight.w500),
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle:
//                   Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.kHintColor),
//               suffixIcon: suffixIcon,
//               prefixIcon: prefixIcon,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

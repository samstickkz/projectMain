import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/utils/string-extensions.dart';
import 'package:project/utils/widget_extensions.dart';

import '../../constants/palette.dart';
import 'apptexts.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final String? hint;
  final String? labelText;
  final bool readonly;
  final bool isPassword;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final Widget? label;
  final double? textSize;
  final VoidCallback? onTap;
  final int? maxLength;
  final bool? haveText;
  final Iterable<String>? autofillHints;
  final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;

  const AppTextField(
      {Key? key,
        this.readonly = false,
        this.isPassword = false,
        this.hintText,
        this.hint,
        this.onChanged,
        this.controller,
        this.keyboardType = TextInputType.text,
        this.onTap,
        this.onEditingComplete,
        this.onFieldSubmitted,
        this.inputFormatter,
        this.validator,
        this.autofillHints,
        this.suffixIcon,
        this.textSize,
        this.haveText,
        this.maxLength,
        this.labelText,
        this.label, this.contentPadding
      })
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
        isVisible = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.hintText != null? Column(
            children: [
              AppText(
                widget.hintText??"",
                size: widget.textSize ?? 14,
                isBold: true,
                align: TextAlign.start,
              ),
              10.0.sbH,
            ],
          ):0.0.sbH,
          TextFormField(
            textAlign: TextAlign.start,
            validator: widget.validator,
            autofillHints: widget.autofillHints,
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            maxLines: 1,
            focusNode: _focusNode,
            maxLength: widget.maxLength,
            onChanged: (val){
              if(widget.onChanged!=null){
                widget.onChanged!(val);
              }
            },
            onTap: widget.onTap,
            readOnly: widget.readonly,
            obscureText: widget.isPassword? !isVisible :false,
            textInputAction: TextInputAction.next,
            controller: widget.controller,
            decoration: InputDecoration(
              errorMaxLines: 3,
              hintText: widget.hint,
              suffixIcon: widget.isPassword ? IconButton(
                onPressed: (){
                  setState(() {
                    isVisible = !isVisible;
                  });
                }, icon: widget.suffixIcon?? Icon(isVisible ? Icons.visibility_off : Icons.visibility)
              ) :widget.suffixIcon,
              filled: true,
              label: widget.label,
              labelText: widget.labelText,
              fillColor: _isFocused ? Colors.white.withOpacity(0.3):textFieldFillColor,
              hintStyle: appStyle,
              isDense: true,
              contentPadding: widget.contentPadding?? const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.transparent)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.transparent)),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              errorStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatter,
          )
        ],
      ),
    );
  }
}

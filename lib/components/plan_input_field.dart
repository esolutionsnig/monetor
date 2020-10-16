import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneytor/components/components.dart';

class PlanInputField extends StatelessWidget {
  final String hinText;
  final ValueChanged<String> onChanged;
  final Function(String) validator;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final int minLines;
  final int maxLines;
  final int maxLength;
  final List<TextInputFormatter> textInputFormatter;
  const PlanInputField({
    Key key,
    this.hinText,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.textCapitalization,
    this.minLines,
    this.maxLines,
    this.textInputFormatter,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlanTextFieldContainer(
      child: TextFormField(
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator,
        keyboardType: keyboardType,
        inputFormatters: textInputFormatter,
        textCapitalization: textCapitalization,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hinText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

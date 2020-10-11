import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Function(String) validator;
  final String hinText;
  final IconData icon;
  final IconData suffxIcon;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.hinText,
    this.icon,
    this.suffxIcon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hinText,
          icon: Icon(
            icon,
            color: kSecondaryColor,
          ),
          suffixIcon: Icon(
            suffxIcon,
            color: kSecondaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

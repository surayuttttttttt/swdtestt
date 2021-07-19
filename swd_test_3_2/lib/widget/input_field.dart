import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final String labelText;
  final Function onSaved;

  InputField({
    @required this.labelText,
    @required this.onSaved,

});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      initialValue: '',
      onSaved: onSaved,
    );
  }
}

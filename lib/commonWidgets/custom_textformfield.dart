import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final GlobalKey<FormFieldState> textFormFieldKey;
  final TextEditingController textFormFieldController;
  const CustomTextFormField(
      {
        Key? key,
        required this.title,
        required this.textFormFieldKey,
        required this.textFormFieldController
      })
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.textFormFieldKey,
      focusNode: _focusNode,
      controller: widget.textFormFieldController,
      onTapOutside: (event) {
        _focusNode.unfocus();
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please enter ${widget.title.toLowerCase()}';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: widget.title,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const OutlineInputBorder()),
    );
  }
}

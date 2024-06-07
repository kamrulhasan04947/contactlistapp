import 'package:flutter/material.dart';
class AppTextField extends StatelessWidget {
  final String hint;
  final TextInputType inputType;
  final TextEditingController controller;
  // final String label;
  const AppTextField({
    super.key,
    required this.hint,
    // required this.label,
    required this.controller,
    required this.inputType
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        style: const TextStyle(
          color: Color.fromRGBO(146, 146, 146, 1),
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(190, 190, 190, 1),
          ),
          // labelText: label,
        ),
        validator:(value){
          if(value == null || value.isEmpty){
            return 'Please fill a ${hint.toLowerCase()}.';
          }
          return null;
        } ,
      ),
    );
  }
}
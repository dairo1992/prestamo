import 'package:flutter/material.dart';

class CustomSelect extends StatelessWidget {
  final List<Map<String, String>> items;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomSelect(
      {super.key,
      required this.items,
      required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromRGBO(49, 101, 52, 1);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        validator: validator,
          items: items
              .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                    value: e["CODIGO"]!,
                    child: Text(
                      e["NOMBRE"]!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: primaryColor, fontSize: 18),
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            controller.text = value!;
          },
          focusNode: FocusNode(),
          hint: const Text(
            "Seleccionar",
            style: TextStyle(color: primaryColor, fontSize: 18),
          ),
          style: const TextStyle(color: primaryColor),
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: primaryColor),
            suffixIconColor: primaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            errorStyle: const TextStyle(color: primaryColor, fontSize: 13),
          )),
    );
  }
}

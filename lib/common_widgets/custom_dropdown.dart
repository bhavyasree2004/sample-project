import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String question;
  final List<String> items;
  final Function(String?) onChanged;
  final String? value;
  final String hintText;

  const CustomDropdown({
    super.key,
    required this.question,
    required this.items,
    required this.onChanged,
    required this.hintText,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          initialValue: value,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade800, width: 2),
              borderRadius: BorderRadius.circular(14),
            ),
            hintText: hintText,
          ),
          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black,fontSize: 16),
          icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
          items: items.map((String item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

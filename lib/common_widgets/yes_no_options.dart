import 'package:flutter/material.dart';

class YesNoOptions extends StatelessWidget {
  final String question;
  final String groupValue;
  final Function(String?) onChanged;
  const YesNoOptions({
    super.key,
    required this.question,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Yes',
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Radio<String>(
              value: 'No',
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ],
    );
  }
}

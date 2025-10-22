import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/education_section.dart';
import '../widgets/employment_section.dart';
import '../form_providers/validator_provider.dart';

class FormScreen extends ConsumerWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sample Form")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const EducationSection(),
            const SizedBox(height: 30),
            const EmploymentSection(),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                validateAndSaveJson(context, ref);
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

validateAndSaveJson(BuildContext context, WidgetRef ref) {
  final validator = ref.watch(validatorProvider);
  if (validator.validateForm()) {
    print("Form submitted successfully!");
    print(validator.toJson());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Form submitted successfully!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Form Submitted'),
        content: SingleChildScrollView(
          child: Text(
            'Data collected:\n\n${validator.toJson()}',
            style: const TextStyle(fontSize: 14),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              validator.resetAllSections();
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  } else {
    print("Form validation failed!");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fix all errors before submitting'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
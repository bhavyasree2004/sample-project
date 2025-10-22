import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sample_enumerator/form_providers/form_section.dart';

import '../form_providers/employment_provider.dart';

class EmploymentSection extends ConsumerWidget {
  const EmploymentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employment = ref.watch(employmentProvider);
    final notifier = ref.read(employmentProvider.notifier);

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Employment Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: TextEditingController(text: employment.company)
                ..selection = TextSelection.collapsed(
                  offset: employment.company.length,
                ),
              decoration: InputDecoration(
                labelText: "Where are you working?",
                errorText: employment.companyError,
              ),
              onChanged: notifier.setCompany,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: TextEditingController(text: employment.designation)
                ..selection = TextSelection.collapsed(
                  offset: employment.designation.length,
                ),
              decoration: InputDecoration(
                labelText: "What is your designation?",
                errorText: employment.designationError,
              ),
              onChanged: notifier.setDesignation,
            ),
            const SizedBox(height: 12),

            const Text("Employment Type:"),
            Row(
              children: [
                Radio<String>(
                  value: "Full-time",
                  groupValue: employment.employmentType,
                  onChanged: (val) {
                    if (val != null) notifier.setEmploymentType(val);
                  },
                ),
                const Text("Full-time"),
                Radio<String>(
                  value: "Part-time",
                  groupValue: employment.employmentType,
                  onChanged: (val) {
                    if (val != null) notifier.setEmploymentType(val);
                  },
                ),
                const Text("Part-time"),
              ],
            ),
            if (employment.employmentType == "Part-time") ...[
              const SizedBox(height: 12),
              TextField(
                controller: TextEditingController(text: employment.duration)
                  ..selection = TextSelection.collapsed(
                    offset: employment.duration.length,
                  ),
                decoration: InputDecoration(
                  labelText: "Enter duration of your Part-Time job",
                  errorText: employment.durationError,
                ),
                keyboardType: TextInputType.number,
                onChanged: notifier.setDuration,
              ),
            ],
            if (employment.employmentTypeError != null)
              Text(
                employment.employmentTypeError!,
                style: TextStyle(fontSize: 12, color: Colors.red[700]),
              ),
            const SizedBox(height: 12),

            const Text("Skills:"),
            Wrap(
              spacing: 8,
              children: ["Flutter", "Dart", "Firebase"].map((skill) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: employment.skills.contains(skill),
                      onChanged: (_) => notifier.toggleSkill(skill),
                    ),
                    Text(skill),
                  ],
                );
              }).toList(),
            ),
            if (employment.skillsError != null)
              Text(
                employment.skillsError!,
                style: TextStyle(fontSize: 12, color: Colors.red[700]),
              ),
            const SizedBox(height: 12),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.any,
                      allowMultiple: false,
                    );

                    if (result != null) {
                      final filePath = result.files.single.path;
                      if (filePath != null) {
                        print("Selected file: $filePath");
                        notifier.setExperienceLetterPath(filePath);
                      }
                    } else {
                      print("No file selected");
                    }
                  },
                  child: const Text("Upload Experience Certificate"),
                ),
                const SizedBox(width: 4),
                if (employment.experienceLetterPath != null)
                  Icon(Icons.check, color: Colors.green),
              ],
            ),
            if (employment.experienceLetterPathError != null)
              Text(
                employment.experienceLetterPathError!,
                style: TextStyle(fontSize: 12, color: Colors.red[700]),
              ),
          ],
        ),
      ),
    );
  }
}

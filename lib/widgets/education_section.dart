import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import '../form_providers/education_provider.dart';

class EducationSection extends ConsumerWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final education = ref.watch(educationProvider);
    final notifier = ref.read(educationProvider.notifier);

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Education Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: TextEditingController(text: education.schoolName)
                ..selection = TextSelection.collapsed(
                  offset: education.schoolName.length,
                ),
              decoration: InputDecoration(
                labelText: "School Name",
                errorText: education.schoolNameError,
              ),
              onChanged: notifier.setSchoolName,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: TextEditingController(text: education.degree)
                ..selection = TextSelection.collapsed(
                  offset: education.degree.length,
                ),
              decoration: InputDecoration(
                labelText: "Degree / Class",
                errorText: education.degreeError,
              ),
              onChanged: notifier.setDegree,
            ),
            const SizedBox(height: 12),

            const Text("Type of School:"),

            Row(
              children: [
                Radio<String>(
                  value: "Public",
                  groupValue: education.schoolType,
                  onChanged: (val) {
                    if (val != null) notifier.setSchoolType(val);
                  },
                ),
                const Text("Public"),
                Radio<String>(
                  value: "Private",
                  groupValue: education.schoolType,
                  onChanged: (val) {
                    if (val != null) notifier.setSchoolType(val);
                  },
                ),
                const Text("Private"),
              ],
            ),
            if (education.schoolType == 'Private')
              if (education.schoolTypeError != null)
                Text(
                  education.schoolTypeError!,
                  style: TextStyle(color: Colors.red[700], fontSize: 12),
                ),
            if (education.schoolType == "Private") ...[
              const SizedBox(height: 12),
              TextField(
                controller: TextEditingController(text: education.feeDetails)
                  ..selection = TextSelection.collapsed(
                    offset: education.feeDetails.length,
                  ),
                decoration: InputDecoration(
                  labelText: "Enter Fee Details",
                  errorText: education.feeDetailsError,
                ),
                keyboardType: TextInputType.number,
                onChanged: notifier.setFeeDetails,
              ),
            ],

            const SizedBox(height: 12),

            const Text("Subjects studied:"),
            Wrap(
              spacing: 8,
              children: ["Math", "Science", "English"].map((subject) {
                bool isDisabled = false;
                if (subject == "Math" &&
                    education.subjects.contains("Science")) {
                  isDisabled = true;
                } else if (subject == "Science" &&
                    education.subjects.contains("Math")) {
                  isDisabled = true;
                }
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IgnorePointer(
                      ignoring: isDisabled,
                      child: Opacity(
                        opacity: isDisabled ? 0.5 : 1.0,
                        child: Checkbox(
                          value: education.subjects.contains(subject),
                          onChanged: (_) => notifier.toggleSubject(subject),
                        ),
                      ),
                    ),
                    Text(subject),
                  ],
                );
              }).toList(),
            ),
            if (education.subjectsError != null)
              Text(
                education.subjectsError!,
                style: TextStyle(color: Colors.red[700], fontSize: 12),
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
                        notifier.setTranscriptPath(filePath);
                      }
                    } else {
                      print("No file selected");
                    }
                  },
                  child: const Text("Upload Transcript / Certificates"),
                ),
                const SizedBox(width: 4),
                if (education.transcriptPath != null)
                  Icon(Icons.check, color: Colors.green),
              ],
            ),
            if (education.transcriptPathError != null)
              Text(
                education.transcriptPathError!,
                style: TextStyle(color: Colors.red[700], fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}

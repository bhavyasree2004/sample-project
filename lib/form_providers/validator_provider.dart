import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_enumerator/form_providers/form_section.dart';

import 'education_provider.dart';
import 'employment_provider.dart';

class FormValidator {
  final List<FormSection> sections;
  FormValidator({required this.sections});

  bool validateForm() {
    bool isValid = true;
    for (var section in sections) {
      if (!section.validate()) {
        isValid = false;
      }
    }
    return isValid;
  }

  void loadAllFromJson(Map<String, dynamic> json) {
    for (var section in sections) {
      if (section is EducationNotifier && json.containsKey('education')) {
        section.loadFromJson(json['education']);
      } else if (section is EmploymentNotifier &&
          json.containsKey('employment')) {
        section.loadFromJson(json['employment']);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    for (var section in sections) {
      result[section.sectionKey] = section.toJson();
    }
    return result;
  }

  void resetAllSections() {
    for (var section in sections) {
      section.reset();
    }
  }
}

final validatorProvider = Provider<FormValidator>((ref) {
  final sections = [
    ref.read(educationProvider.notifier),
    ref.read(employmentProvider.notifier),
  ];
  return FormValidator(sections: sections);
});

import 'package:flutter_riverpod/legacy.dart';
import 'package:sample_enumerator/form_providers/form_section.dart';

class EmploymentState {
  final String company;
  final String designation;
  final String employmentType;
  final List<String> skills;
  final String? experienceLetterPath;
  final String duration;

  //Validation Errors
  final String? companyError;
  final String? designationError;
  final String? employmentTypeError;
  final String? skillsError;
  final String? experienceLetterPathError;
  final String? durationError;

  EmploymentState({
    this.company = '',
    this.designation = '',
    this.employmentType = '',
    this.skills = const [],
    this.experienceLetterPath,
    this.duration = '',
    this.companyError,
    this.designationError,
    this.employmentTypeError,
    this.skillsError,
    this.experienceLetterPathError,
    this.durationError,
  });

  EmploymentState copyWith({
    String? company,
    String? designation,
    String? employmentType,
    List<String>? skills,
    String? experienceLetterPath,
    String? duration,
    bool clearCompanyError = false,
    bool clearDesignationError = false,
    bool clearEmploymentTypeError = false,
    bool clearSkillsError = false,
    bool clearExperienceLetterPathError = false,
    bool clearDurationError = false,
    String? companyError,
    String? designationError,
    String? employmentTypeError,
    String? skillsError,
    String? experienceLetterPathError,
    String? durationError,
  }) {
    return EmploymentState(
      company: company ?? this.company,
      designation: designation ?? this.designation,
      employmentType: employmentType ?? this.employmentType,
      skills: skills ?? this.skills,
      experienceLetterPath: experienceLetterPath ?? this.experienceLetterPath,
      duration: duration ?? this.duration,
      companyError: clearCompanyError
          ? null
          : (companyError ?? this.companyError),
      designationError: clearDesignationError
          ? null
          : (designationError ?? this.designationError),
      employmentTypeError: clearEmploymentTypeError
          ? null
          : (employmentTypeError ?? this.employmentTypeError),
      skillsError: clearSkillsError ? null : (skillsError ?? this.skillsError),
      experienceLetterPathError: clearExperienceLetterPathError
          ? null
          : (experienceLetterPathError ?? this.experienceLetterPathError),
      durationError: clearDurationError
          ? null
          : (durationError ?? this.durationError),
    );
  }

  factory EmploymentState.fromJson(Map<String, dynamic> json) {
    return EmploymentState(
      company: json['company'] ?? '',
      designation: json['designation'] ?? '',
      employmentType: json['employment_type'] ?? '',
      skills: json['skills'],
      experienceLetterPath: json['experience_letter_path'] ?? '',
      duration: json['parttime_duration'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'company': company,
    'designation': designation,
    'employment_type': employmentType,
    'skills': skills,
    'experience_letter_path': experienceLetterPath,
    'parttime_duration': duration,
  };
}

class EmploymentNotifier extends StateNotifier<EmploymentState>
    implements FormSection {
  EmploymentNotifier() : super(EmploymentState());

  void loadFromJson(Map<String, dynamic> json) {
    state = EmploymentState.fromJson(json);
  }

  void setCompany(String name) =>
      state = state.copyWith(company: name, clearCompanyError: true);
  void setDesignation(String des) =>
      state = state.copyWith(designation: des, clearDesignationError: true);
  void setEmploymentType(String type) => state = state.copyWith(
    employmentType: type,
    clearEmploymentTypeError: true,
  );
  void toggleSkill(String skill) {
    final skills = [...state.skills];
    if (skills.contains(skill)) {
      skills.remove(skill);
    } else {
      skills.add(skill);
    }
    state = state.copyWith(skills: skills, clearSkillsError: true);
  }

  void setExperienceLetterPath(String path) {
    state = state.copyWith(
      experienceLetterPath: path,
      clearExperienceLetterPathError: true,
    );
  }

  void setDuration(String duration) {
    state = state.copyWith(duration: duration, clearDurationError: true);
  }

  @override
  String get sectionKey => 'employment';

  String? _validateCompanyName() {
    if (state.company.isEmpty) {
      return "Company name is required";
    } else if (state.company.length < 3) {
      return "Must be 3 characters atleast";
    } else {
      return null;
    }
  }

  @override
  bool validate() {
    String? companyError = _validateCompanyName();
    String? designationError = state.designation.isEmpty
        ? 'Designation is required'
        : null;
    String? employmentTypeError = state.employmentType.isEmpty
        ? 'Select employment type'
        : null;
    String? skillsError = state.skills.isEmpty
        ? 'Select atleast one skill'
        : null;
    String? experienceLetterPathError =
        (state.experienceLetterPath == null ||
            state.experienceLetterPath!.isEmpty)
        ? "Upload Experience Letter"
        : null;
    String? durationError =
        (state.employmentType == 'Part-time' && state.duration.isEmpty)
        ? "Please enter the duration"
        : null;

    state = state.copyWith(
      companyError: companyError,
      designationError: designationError,
      employmentTypeError: employmentTypeError,
      skillsError: skillsError,
      experienceLetterPathError: experienceLetterPathError,
      durationError: durationError,
    );

    return companyError == null &&
        designationError == null &&
        employmentTypeError == null &&
        skillsError == null &&
        experienceLetterPathError == null &&
        durationError == null;
  }

  @override
  Map<String, dynamic> toJson() {
    return state.toJson();
  }

  @override
  void reset() {
    state = EmploymentState();
  }
}

final employmentProvider =
    StateNotifierProvider<EmploymentNotifier, EmploymentState>(
      (ref) => EmploymentNotifier(),
    );

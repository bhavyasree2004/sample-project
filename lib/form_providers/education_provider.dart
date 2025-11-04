import 'package:flutter_riverpod/legacy.dart';
import 'package:hive/hive.dart';
import 'package:sample_enumerator/form_providers/form_section.dart';

class EducationState {
  final String schoolName;
  final String degree;
  final String schoolType;
  final List<String> subjects;
  final String? transcriptPath;
  final String feeDetails;

  //Validation Errors
  final String? schoolNameError;
  final String? degreeError;
  final String? schoolTypeError;
  final String? subjectsError;
  final String? transcriptPathError;
  final String? feeDetailsError;

  EducationState({
    this.schoolName = '',
    this.degree = '',
    this.schoolType = '',
    this.subjects = const [],
    this.transcriptPath,
    this.feeDetails = '',
    this.schoolNameError,
    this.degreeError,
    this.schoolTypeError,
    this.subjectsError,
    this.transcriptPathError,
    this.feeDetailsError,
  });

  EducationState copyWith({
    String? schoolName,
    String? degree,
    String? schoolType,
    List<String>? subjects,
    String? transcriptPath,
    String? feeDetails,
    bool clearSchoolNameError = false,
    bool clearDegreeError = false,
    bool clearSchoolTypeError = false,
    bool clearSubjectsError = false,
    bool clearTranscriptPathError = false,
    bool clearFeeDetailsError = false,
    String? schoolNameError,
    String? degreeError,
    String? schoolTypeError,
    String? subjectsError,
    String? transcriptPathError,
    String? feeDetailsError,
  }) {
    return EducationState(
      schoolName: schoolName ?? this.schoolName,
      degree: degree ?? this.degree,
      schoolType: schoolType ?? this.schoolType,
      subjects: subjects ?? this.subjects,
      transcriptPath: transcriptPath ?? this.transcriptPath,
      feeDetails: feeDetails ?? this.feeDetails,
      schoolNameError: clearSchoolNameError
          ? null
          : (schoolNameError ?? this.schoolNameError),
      degreeError: clearDegreeError ? null : (degreeError ?? this.degreeError),
      schoolTypeError: clearSchoolTypeError
          ? null
          : (schoolTypeError ?? this.schoolTypeError),
      subjectsError: clearSubjectsError
          ? null
          : (subjectsError ?? this.subjectsError),
      transcriptPathError: clearTranscriptPathError
          ? null
          : (transcriptPathError ?? this.transcriptPathError),
      feeDetailsError: clearFeeDetailsError
          ? null
          : (feeDetailsError ?? this.feeDetailsError),
    );
  }

  factory EducationState.fromJson(Map<String, dynamic> json) {
    return EducationState(
      schoolName: json['school_name'] ?? '',
      degree: json['degree'] ?? '',
      schoolType: json['school_type'] ?? '',
      subjects: json['subjects'] ?? '',
      transcriptPath: json['transcript_path'] ?? '',
      feeDetails: json['fee_details'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'school_name': schoolName,
    'degree': degree,
    'school_type': schoolType,
    'subjects': subjects,
    'transcript_path': transcriptPath,
    'fee_details': feeDetails,
  };
}

class EducationNotifier extends StateNotifier<EducationState>
    implements FormSection {
  EducationNotifier() : super(EducationState()) {
    _loadLocalData();
  }

  final _educationBox = Hive.box('educationBox');

  Future<void> _loadLocalData() async {
    final savedData = _educationBox.get('educationData');
    if (savedData != null) {
      state = EducationState.fromJson(Map<String, dynamic>.from(savedData));
    }
  }

  void saveLocalData() {
    _educationBox.put('educationData', state.toJson());
    print("Data has been saved locally");
  }

  @override
  void loadFromJson(Map<String, dynamic> json) {
    state = EducationState.fromJson(json);
  }

  void setSchoolName(String name) {
    state = state.copyWith(schoolName: name, clearSchoolNameError: true);
    saveLocalData();
  }

  void setDegree(String degree) {
    state = state.copyWith(degree: degree, clearDegreeError: true);
    saveLocalData();
  }

  void setSchoolType(String type) {
    state = state.copyWith(schoolType: type, clearSchoolTypeError: true);
    saveLocalData();
  }

  void toggleSubject(String subject) {
    final subjects = [...state.subjects];
    if (subjects.contains(subject)) {
      subjects.remove(subject);
    } else {
      subjects.add(subject);
    }
    state = state.copyWith(subjects: subjects, clearSubjectsError: true);
    saveLocalData();
  }

  void setFeeDetails(String value) {
    state = state.copyWith(feeDetails: value, clearFeeDetailsError: true);
    saveLocalData();
  }

  void setTranscriptPath(String path) {
    state = state.copyWith(
      transcriptPath: path,
      clearTranscriptPathError: true,
    );
    saveLocalData();
  }

  @override
  String get sectionKey => 'education';

  bool _isValidNumber(dynamic value) {
    final number = num.tryParse(value);
    return number == 10;
  }

  String? _validateSchoolName() {
    if (state.schoolName.isEmpty) {
      return "School Name is required";
    } else if (state.schoolName.length < 3) {
      return "Must contain atleast 3 characters";
    } else {
      return null;
    }
  }

  String? _validateDegree() {
    if (state.degree.isEmpty) {
      return "Degree is required";
    } else if (!_isValidNumber(state.degree)) {
      return "Please enter valid degree";
    } else {
      return null;
    }
  }

  @override
  bool validate() {
    String? schoolNameError = _validateSchoolName();
    String? degreeError = _validateDegree();
    String? schoolTypeError = state.schoolType.isEmpty
        ? 'Select school type'
        : null;
    String? subjectsError = state.subjects.isEmpty
        ? 'Select atleast one subject'
        : null;
    String? transcriptPathError =
        (state.transcriptPath == null || state.transcriptPath!.isEmpty)
        ? 'Upload Transcript File'
        : null;
    String? feeDetailsError =
        (state.schoolType == 'Private' && state.feeDetails.isEmpty)
        ? 'Please enter Fee details'
        : null;

    state = state.copyWith(
      schoolNameError: schoolNameError,
      degreeError: degreeError,
      schoolTypeError: schoolTypeError,
      subjectsError: subjectsError,
      transcriptPathError: transcriptPathError,
      feeDetailsError: feeDetailsError,
    );

    return schoolNameError == null &&
        degreeError == null &&
        schoolTypeError == null &&
        subjectsError == null &&
        transcriptPathError == null &&
        feeDetailsError == null;
  }

  @override
  Map<String, dynamic> toJson() {
    return state.toJson();
  }

  @override
  void reset() {
    state = EducationState();
    _educationBox.delete('educationData');
    print("Data has been removed locally");
  }
}

final educationProvider =
    StateNotifierProvider<EducationNotifier, EducationState>(
      (ref) => EducationNotifier(),
    );

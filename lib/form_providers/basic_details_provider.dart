import 'package:flutter_riverpod/legacy.dart';
import 'package:sample_enumerator/form_providers/form_section.dart';

class BasicDetailsState {
  final String age;
  final String mobileNumber;
  final String voterId;
  final String religion;
  final String caste;
  final String subCaste;
  final String casteCertificateObtained;
  final String gender;
  final String isSemiNomadic;
  final String aadhaarNumber;
  final String motherTongue;
  final String maritalStatus;
  final String ageDuringMarriage;
  final String isDisabled;

  //Validation Errors
  final String? ageError;
  final String? mobileNumberError;
  final String? voterIdError;
  final String? religionError;
  final String? casteError;
  final String? subCasteError;
  final String? casteCertificateObtainedError;
  final String? genderError;
  final String? isSemiNomadicError;
  final String? aadhaarNumberError;
  final String? motherTongueError;
  final String? maritalStatusError;
  final String? ageDuringMarriageError;
  final String? isDisabledError;

  BasicDetailsState({
    this.age = '',
    this.mobileNumber = '',
    this.voterId = '',
    this.religion = '',
    this.caste = '',
    this.subCaste = '',
    this.casteCertificateObtained = '',
    this.gender = '',
    this.isSemiNomadic = '',
    this.aadhaarNumber = '',
    this.motherTongue = '',
    this.maritalStatus = '',
    this.ageDuringMarriage = '',
    this.isDisabled = '',
    this.ageError,
    this.mobileNumberError,
    this.voterIdError,
    this.religionError,
    this.casteError,
    this.subCasteError,
    this.casteCertificateObtainedError,
    this.genderError,
    this.isSemiNomadicError,
    this.aadhaarNumberError,
    this.motherTongueError,
    this.maritalStatusError,
    this.ageDuringMarriageError,
    this.isDisabledError,
  });

  BasicDetailsState copyWith({
    String? age,
    String? mobileNumber,
    String? voterId,
    String? religion,
    String? caste,
    String? subCaste,
    String? casteCertificateObtained,
    String? gender,
    String? isSemiNomadic,
    String? aadhaarNumber,
    String? motherTongue,
    String? maritalStatus,
    String? ageDuringMarriage,
    String? isDisabled,
    bool clearAgeError = false,
    bool clearMobileNumberError = false,
    bool clearVoterIdError = false,
    bool clearReligionError = false,
    bool clearCasteError = false,
    bool clearSubCasteError = false,
    bool clearCasteCertificateObtainedError = false,
    bool clearGenderError = false,
    bool clearIsSemiNomadicError = false,
    bool clearAadhaarNumberError = false,
    bool clearMotherTongueError = false,
    bool clearMaritalStatusError = false,
    bool clearAgeDuringMarriageError = false,
    bool clearIsDisabledError = false,
    String? ageError,
    String? mobileNumberError,
    String? voterIdError,
    String? religionError,
    String? casteError,
    String? subCasteError,
    String? casteCertificateObtainedError,
    String? genderError,
    String? isSemiNomadicError,
    String? aadhaarNumberError,
    String? motherTongueError,
    String? maritalStatusError,
    String? ageDuringMarriageError,
    String? isDisabledError,
  }) {
    return BasicDetailsState(
      age: age ?? this.age,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      voterId: voterId ?? this.voterId,
      religion: religion ?? this.religion,
      caste: caste ?? this.caste,
      subCaste: subCaste ?? this.subCaste,
      casteCertificateObtained:
          casteCertificateObtained ?? this.casteCertificateObtained,
      gender: gender ?? this.gender,
      isSemiNomadic: isSemiNomadic ?? this.isSemiNomadic,
      aadhaarNumber: aadhaarNumber ?? this.aadhaarNumber,
      motherTongue: motherTongue ?? this.motherTongue,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      ageDuringMarriage: ageDuringMarriage ?? this.ageDuringMarriage,
      isDisabled: isDisabled ?? this.isDisabled,
      ageError: clearAgeError ? null : (ageError ?? this.ageError),
      mobileNumberError: clearMobileNumberError
          ? null
          : (mobileNumberError ?? this.mobileNumberError),
      voterIdError: clearVoterIdError
          ? null
          : (voterIdError ?? this.voterIdError),
      religionError: clearReligionError
          ? null
          : (religionError ?? this.religionError),
      casteError: clearCasteError ? null : (casteError ?? this.casteError),
      subCasteError: clearSubCasteError
          ? null
          : (subCasteError ?? this.subCasteError),
      casteCertificateObtainedError: clearCasteCertificateObtainedError
          ? null
          : (casteCertificateObtainedError ??
                this.casteCertificateObtainedError),
      genderError: clearGenderError ? null : (genderError ?? this.genderError),
      isSemiNomadicError: clearIsSemiNomadicError
          ? null
          : (isSemiNomadicError ?? this.isSemiNomadicError),
      aadhaarNumberError: clearAadhaarNumberError
          ? null
          : (aadhaarNumberError ?? this.aadhaarNumberError),
      motherTongueError: clearMotherTongueError
          ? null
          : (motherTongueError ?? this.motherTongueError),
      maritalStatusError: clearMaritalStatusError
          ? null
          : (maritalStatusError ?? this.maritalStatusError),
      ageDuringMarriageError: clearAgeDuringMarriageError
          ? null
          : (ageDuringMarriageError ?? this.ageDuringMarriageError),
      isDisabledError: clearIsDisabledError
          ? null
          : (isDisabledError ?? this.isDisabledError),
    );
  }

  factory BasicDetailsState.fromJson(Map<String, dynamic> json) {
    return BasicDetailsState(
      age: json['age'] ?? '',
      mobileNumber: json['mobile_number'] ?? '',
      voterId: json['voter_id'] ?? '',
      religion: json['religion'] ?? '',
      caste: json['caste'] ?? '',
      subCaste: json['sub_caste'] ?? '',
      casteCertificateObtained: json['caste_certificate_obtained'] ?? '',
      gender: json['gender'] ?? '',
      isSemiNomadic: json['is_semi_nomadic'] ?? '',
      aadhaarNumber: json['aadhaar_number'] ?? '',
      motherTongue: json['mother_tongue'] ?? '',
      maritalStatus: json['marital_status'] ?? '',
      ageDuringMarriage: json['age_during_marriage'] ?? '',
      isDisabled: json['is_disabled'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'age': age,
    'mobile_number': mobileNumber,
    'voter_id': voterId,
    'religion': religion,
    'caste': caste,
    'sub_caste': subCaste,
    'caste_certificate_obtained': casteCertificateObtained,
    'gender': gender,
    'is_semi_nomadic': isSemiNomadic,
    'aadhaar_number': aadhaarNumber,
    'mother_tongue': motherTongue,
    'marital_status': maritalStatus,
    'age_during_marriage': ageDuringMarriage,
    'is_disabled': isDisabled,
  };
}

class BasicDetailsNotifier extends StateNotifier<BasicDetailsState>
    implements FormSection {
  BasicDetailsNotifier() : super(BasicDetailsState());
  @override
  void reset() {
    state = BasicDetailsState();
  }

  void setMobileNumber(String mobileNumber) => state = state.copyWith(
    mobileNumber: mobileNumber,
    clearMobileNumberError: true,
  );

  void setAge(String age) =>
      state = state.copyWith(age: age, clearAgeError: true);

  void setVoterIdNumber(String voterId) =>
      state = state.copyWith(voterId: voterId, clearVoterIdError: true);

  void setReligion(String religion) =>
      state = state.copyWith(religion: religion, clearReligionError: true);

  void setCaste(String caste) =>
      state = state.copyWith(caste: caste, clearCasteError: true);

  void setSubCaste(String subCaste) =>
      state = state.copyWith(subCaste: subCaste, clearSubCasteError: true);

  void setCasteCertificateObtained(String casteCertificateObtained) =>
      state = state.copyWith(
        casteCertificateObtained: casteCertificateObtained,
        clearCasteCertificateObtainedError: true,
      );

  void setGender(String gender) =>
      state = state.copyWith(gender: gender, clearGenderError: true);

  void setIsSemiNomadic(String isSemiNomadic) => state = state.copyWith(
    isSemiNomadic: isSemiNomadic,
    clearIsSemiNomadicError: true,
  );

  void setAadhaarNumber(String aadhaarNumber) => state = state.copyWith(
    aadhaarNumber: aadhaarNumber,
    clearAadhaarNumberError: true,
  );

  void setMotherTongue(String motherTongue) => state = state.copyWith(
    motherTongue: motherTongue,
    clearMotherTongueError: true,
  );

  void setMaritalStatus(String maritalStatus) => state = state.copyWith(
    maritalStatus: maritalStatus,
    clearMaritalStatusError: true,
  );

  void setAgeDuringMarriage(String ageDuringMarriage) => state = state.copyWith(
    ageDuringMarriage: ageDuringMarriage,
    clearAgeDuringMarriageError: true,
  );

  void setIsDisabled(String isDisabled) => state = state.copyWith(
    isDisabled: isDisabled,
    clearIsDisabledError: true,
  );

  @override
  String get sectionKey => 'basic_details';

  @override
  Map<String, dynamic> toJson() {
    return state.toJson();
  }

  @override
  bool validate() {
    String? ageError = state.age.isEmpty ? "Age is required" : null;
    String? mobileNumberError = state.mobileNumber.isEmpty
        ? "Mobile number is required"
        : null;
    String? voterIdError = state.voterId.isEmpty
        ? "Voter ID is required"
        : null;
    String? religionError = state.religion.isEmpty
        ? "Religion is required"
        : null;
    String? casteError = state.caste.isEmpty ? "Caste is required" : null;
    String? subCasteError = state.subCaste.isEmpty
        ? "Sub Caste is required"
        : null;
    String? casteCertificateObtainedError =
        state.casteCertificateObtained.isEmpty
        ? "This field is required"
        : null;
    String? genderError = state.gender.isEmpty ? "Gender is required" : null;
    String? isSemiNomadicError = state.isSemiNomadic.isEmpty
        ? "This field is required"
        : null;
    String? aadhaarNumberError = state.aadhaarNumber.isEmpty
        ? "Aadhaar number is required"
        : null;
    String? motherTongueError = state.motherTongue.isEmpty
        ? "Mother Tongue is required"
        : null;
    String? maritalStatusError = state.maritalStatus.isEmpty
        ? "Marital status is required"
        : null;
    String? ageDuringMarriageError =
        (state.maritalStatus == 'Married' && state.ageDuringMarriage.isEmpty)
        ? "This field is required"
        : null;
    String? isDisabledError = state.isDisabled.isEmpty
        ? "This field is required"
        : null;

    state = state.copyWith(
      ageError: ageError,
      mobileNumberError: mobileNumberError,
      voterIdError: voterIdError,
      religionError: religionError,
      casteError: casteError,
      subCasteError: subCasteError,
      casteCertificateObtainedError: casteCertificateObtainedError,
      genderError: genderError,
      isSemiNomadicError: isSemiNomadicError,
      aadhaarNumberError: aadhaarNumberError,
      motherTongueError: motherTongueError,
      maritalStatusError: maritalStatusError,
      ageDuringMarriage: ageDuringMarriageError,
      isDisabledError: isDisabledError,
    );

    return ageError == null &&
        mobileNumberError == null &&
        voterIdError == null &&
        religionError == null &&
        casteError == null &&
        subCasteError == null &&
        casteCertificateObtainedError == null &&
        genderError == null &&
        isSemiNomadicError == null &&
        aadhaarNumberError == null &&
        motherTongueError == null &&
        maritalStatusError == null &&
        ageDuringMarriageError == null &&
        isDisabledError == null;
  }

  @override
  void loadFromJson(Map<String, dynamic> json) {
    state = BasicDetailsState.fromJson(json);
  }
}

final basicDetailsProvider =
    StateNotifierProvider<BasicDetailsNotifier, BasicDetailsState>(
      (ref) => BasicDetailsNotifier(),
    );

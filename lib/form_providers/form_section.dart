abstract class FormSection {
  String get sectionKey;
  bool validate();
  Map<String, dynamic> toJson();
  void reset();
}
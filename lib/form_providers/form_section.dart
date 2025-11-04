abstract class FormSection {
  String get sectionKey;
  void loadFromJson(Map<String,dynamic> json);
  bool validate();
  Map<String, dynamic> toJson();
  void reset();
}
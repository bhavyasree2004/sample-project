import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_enumerator/common_widgets/custom_dropdown.dart';
import 'package:sample_enumerator/common_widgets/custom_input_field.dart';
import 'package:sample_enumerator/form_providers/basic_details_provider.dart';

class BasicDetailsSection extends ConsumerWidget {
  const BasicDetailsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(basicDetailsProvider.notifier);
    return Column(
      children: [
        CustomInputField(
          hintText: "Enter Age",
          onChanged: notifier.setAge,
          question: "Age",
        ),
        SizedBox(height: 10),
        CustomInputField(
          hintText: "Enter Mobile Number",
          onChanged: notifier.setMobileNumber,
          question: "Mobile Number",
        ),
        SizedBox(height: 10),
        CustomInputField(
          hintText: "Enter Voter ID Number",
          onChanged: notifier.setVoterIdNumber,
          question: "Voter ID Number",
        ),
        SizedBox(height: 10,),
        CustomDropdown(question: "Religion", items: ['Hindu','Muslim','Christian'], hintText: "Select Religion",onChanged: notifier.setReligion),
        SizedBox(height: 10,),
        CustomDropdown(question: "Caste", items: ["BC-A","BC-B","BC-D","OC"],hintText: "Select Caste", onChanged: notifier.setCaste),
        SizedBox(height: 10,),
        CustomDropdown(question: "Sub Caste", items: ["Reddy","Naidu","SistaKarnam","Velama"], onChanged: notifier.setSubCaste, hintText: "Select Sub Caste"),
      ],
    );
  }
}

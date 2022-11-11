import 'package:dimora_duomo/constants.dart';
import 'package:dimora_duomo/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomDropDown extends StatelessWidget {
  final InputController dropdownController = InputController();
  final String hintText;
  final List<String> list;

  final void Function(String) onAnswer;

  CustomDropDown({
    super.key,
    required this.hintText,
    required this.list,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ButtonTheme(
            alignedDropdown: true,
            child: Obx(
              () => DropdownButtonFormField(
                  icon: const Icon(
                    FontAwesomeIcons.chevronDown,
                    color: kButtonSecondaryColor,
                    size: 28,
                  ),
                  isExpanded: true,
                  dropdownColor: kSecondaryColor,
                  borderRadius: BorderRadius.circular(30),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: hintText,
                    hintStyle:
                        const TextStyle(fontSize: 18.0, color: Colors.black54),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  value: dropdownController.selected.value.isEmpty
                      ? null
                      : dropdownController.selected.value,
                  items: list.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e,
                          style: const TextStyle(
                              fontSize: 18.0, color: kPrimaryColor)),
                    );
                  }).toList(),
                  // validator: dropdownController.validator,
                  onChanged: (newValue) {
                    dropdownController.setSelectedDD(newValue!);
                    onAnswer(newValue);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key, this.onChanged});
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
      child: Center(
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
              // contentPadding: EdgeInsets.only(left: 7.5),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              suffixIcon: Icon(Icons.arrow_drop_down, size: 28)),
          icon: const Padding(padding: EdgeInsets.only(right: 7.5)),
          items: <String>['Male', 'Female', 'Other']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                padding: const EdgeInsets.only(left: 21),
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff505050),
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          isExpanded: true,
          hint: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.0),
            child: Text(
              'Genders',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff505050),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

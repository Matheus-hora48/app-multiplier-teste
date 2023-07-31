import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final int value;
  final List<DropdownMenuItem<int>> items;
  final Function(int?) onChanged;

  const CustomDropdown(
      {super.key,
      required this.hintText,
      required this.value,
      required this.items,
      required this.onChanged});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButton(
        value: widget.value,
        items: widget.items,
        onChanged: widget.onChanged,
        hint: Text(widget.hintText),
        underline: const SizedBox(),
        isExpanded: true,
        padding: const EdgeInsets.all(12),
        isDense: true,
      ),
    );
  }
}

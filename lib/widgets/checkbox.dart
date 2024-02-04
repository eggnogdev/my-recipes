import 'package:flutter/material.dart';

/// A [Checkbox] that manages its own state
class ManagedCheckbox extends StatefulWidget {
  const ManagedCheckbox({super.key});

  @override
  State<ManagedCheckbox> createState() => _ManagedCheckboxState();
}

class _ManagedCheckboxState extends State<ManagedCheckbox> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (value) {
        setState(() {
          this.value = value;
        });
      },
    );
  }
}

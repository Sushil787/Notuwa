import 'package:flutter/material.dart';
import 'package:kuraa/core/helper/extension/string_extension.dart';

/// Custon Text Field
class CustomTextField extends StatefulWidget {
  /// Constructor
   CustomTextField({
    required this.hintText,
    required this.onChanged,
    required this.prefixIcon,
    this.validator,
    this.isPassword = false,
    super.key,
  });

  /// Hint text
  final String hintText;

  /// Hint text
  final String? Function(String?)? validator;

  /// Is Pasword Field
  final bool isPassword;

  /// Icon Data
  final IconData prefixIcon;

  /// Function(String) callback
  final void Function(String) onChanged;

  /// TextEditing controller for [TextFormField]
  final TextEditingController controller = TextEditingController();

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator ??
          (value) {
            if (value!.isEmpty) {
              return 'please enter your ${widget.hintText}';
            } else if (value.isNotEmpty &&
                widget.hintText == 'email' &&
                !value.isValidEmail()) {
              return 'please enter valid email';
            }
            return null;
          },
      onChanged: (newValue) {
        widget.onChanged.call(newValue);
      },
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      textInputAction: TextInputAction.next,
      cursorColor: const Color.fromARGB(31, 74, 68, 68),
      cursorHeight: 20,
      obscureText: widget.isPassword && !isVisible,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: isVisible
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
            : null,
        prefixIcon: Icon(widget.prefixIcon),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: const Color.fromARGB(31, 74, 68, 68),
        hintText: widget.hintText,
      ),
    );
  }
}

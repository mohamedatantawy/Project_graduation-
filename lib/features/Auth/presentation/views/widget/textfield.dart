import 'package:flutter/material.dart';
import 'package:project_greduation/constants.dart';

class customtextFormField extends StatefulWidget {
  const customtextFormField({
    super.key,
    required this.title,
    this.icon,
    this.posticon = false,
    required this.text,
    this.fill = true, this.validator,
  });
  final String title;
  final IconData? icon;
  final bool posticon;
  final bool fill;
  final TextEditingController text;
  // final TextEditingController? confirm;
  final String?  Function(String?)? validator;
  @override
  State<customtextFormField> createState() => _customtextFormFieldState();
}

class _customtextFormFieldState extends State<customtextFormField> {
  bool isactive = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: TextFormField(
        controller: widget.text,
        validator:widget.fill? (value) {
          if (value!.isEmpty) {
            return 'this field is required';
          } else {
            return null;
          }
        }:widget.validator,
        obscuringCharacter: '*',
        obscureText: widget.posticon ? isactive : false,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: widget.title,

          hintStyle: TextStyle(),
          prefixIcon: Icon(
            widget.icon,
            size: 20,
          ),
          suffixIcon: widget.posticon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isactive = !isactive;
                    });
                  },
                  icon: Visibility(
                    visible: isactive,
                    child: Icon(Icons.visibility),
                    replacement: Icon(Icons.visibility_off),
                  ))
              : null,
          // labelText: 'Eamil',

          filled: true,

          fillColor: widget.fill ? ktextbackground : Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomAcademy extends StatelessWidget {
  final String label;

  const CustomAcademy({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: TextFormField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
              width: 1.0,
            ))),
          ),
        )
      ],
    );
  }
}

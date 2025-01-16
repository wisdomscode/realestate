import 'package:flutter/material.dart';
import 'package:realestate/widgets/text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.name,
    required this.submit,
    this.width,
  });

  final String name;
  final VoidCallback submit;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: submit,
      child: CustomTextWidget(
        text: name,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: Size(
          width ?? double.infinity,
          50,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:realestate/models/property_model.dart';
import 'package:realestate/widgets/text_widget.dart';

class DetailPropertyPage extends StatefulWidget {
  const DetailPropertyPage({super.key, required this.property});

  final PropertyModel property;

  @override
  State<DetailPropertyPage> createState() => _DetailPropertyPageState();
}

class _DetailPropertyPageState extends State<DetailPropertyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                widget.property.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 15),
            CustomTextWidget(
              text: widget.property.title,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            CustomTextWidget(
              text: "₦${widget.property.price}",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            const CustomTextWidget(
              text: 'Nice house for sale',
            ),
            CustomTextWidget(
              text: widget.property.description,
              color: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}

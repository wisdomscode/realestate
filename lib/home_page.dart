import 'package:flutter/material.dart';
import 'package:realestate/widgets/text_formfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            children: [
              CustomTextFormField(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
              ),
              Image.asset(
                "assets/images/house1.jpg",
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:realestate/widgets/text_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: 'Login Page',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            CustomTextWidget(
              text: 'Welcome back',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                // hintText: 'Email',
                label: CustomTextWidget(text: 'Email Address'),
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.red),
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  // hintText: 'Paasword',
                  label: CustomTextWidget(text: 'Password'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.red),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: Icon(Icons.remove_red_eye)),
            ),
          ],
        ),
      ),
    );
  }
}

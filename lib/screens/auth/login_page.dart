import 'package:flutter/material.dart';
import 'package:realestate/bottom_nav_bar.dart';
import 'package:realestate/screens/home_page.dart';
import 'package:realestate/widgets/button_widget.dart';
import 'package:realestate/widgets/text_formfield.dart';
import 'package:realestate/widgets/text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObsecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              text: 'Login Page',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            const CustomTextWidget(
              text: 'Welcome back',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              label: const CustomTextWidget(text: 'Email'),
              prefixIcon: Icon(Icons.email),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: const CustomTextWidget(text: 'Password'),
              prefixIcon: Icon(Icons.key),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObsecured = !isObsecured;
                  });
                },
                icon: isObsecured ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              ),
              obscureText: isObsecured,
            ),
            const SizedBox(height: 50),
            CustomButtonWidget(
              name: 'LOGIN',
              submit: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BottomNavBarPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

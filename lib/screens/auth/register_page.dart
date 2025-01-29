import 'package:flutter/material.dart';
import 'package:realestate/widgets/button_widget.dart';
import 'package:realestate/widgets/text_formfield.dart';
import 'package:realestate/widgets/text_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObsecured = true;
  bool isObsecured2 = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextWidget(
                    text: 'Register Page',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  const CustomTextWidget(
                    text: 'Welcome',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username MUST NOT be empty";
                      } else if (value.length < 2) {
                        return "Username must be at least 2 characters";
                      }
                      return null;
                    },
                    label: CustomTextWidget(text: 'Username'),
                    prefixIcon: Icon(Icons.person),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email MUST NOT be empty";
                      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    label: CustomTextWidget(text: 'Email'),
                    prefixIcon: Icon(Icons.email),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                        return 'Password must contain at least one capital letter';
                      } else if (!RegExp(r'(?=.*[0-9])').hasMatch(value)) {
                        return 'Password must contain at least one number';
                      } else if (!RegExp(r'(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(value)) {
                        return 'Must contain at least one special character';
                      }
                      return null;
                    },
                    label: const CustomTextWidget(text: 'Password'),
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObsecured = !isObsecured;
                        });
                      },
                      icon: isObsecured ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    ),
                    obscureText: isObsecured,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    validator: (value) => value != passwordController.text ? 'Passwords does not match' : null,
                    // validator: (value) {
                    //   if (value != passwordController.text) {
                    //     return 'Passwords does not match';
                    //   }
                    //   return null;
                    // },
                    label: const CustomTextWidget(text: 'Confirm Password'),
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObsecured2 = !isObsecured2;
                        });
                      },
                      icon: isObsecured2 ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    ),
                    obscureText: isObsecured2,
                  ),
                  const SizedBox(height: 50),
                  CustomButtonWidget(
                    name: 'REGISTER',
                    submit: () {
                      if (_formKey.currentState!.validate()) {
                        print('Form Data are now valid');
                        print(usernameController.text);
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

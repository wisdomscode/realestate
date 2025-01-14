import 'package:flutter/material.dart';
import 'package:realestate/widgets/social_login_buttons.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/house6.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: 250),
                    Text(
                      'Discover Your Dream Home',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 5,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('LOGIN'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            minimumSize: Size(180, 50),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('REGISTER'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white60,
                            foregroundColor: Colors.black,
                            minimumSize: Size(180, 50),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 130,
                          height: 1,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
                        ),
                        Text('or Login with'),
                        Container(
                          width: 130,
                          height: 1,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    SocialLoginButton(
                      image: 'assets/images/google.png',
                      title: 'Login With Google',
                    ),
                    SizedBox(height: 15),
                    SocialLoginButton(
                      image: 'assets/images/apple.png',
                      title: 'Login With Apple',
                    ),
                    SizedBox(height: 15),
                    SocialLoginButton(
                      image: 'assets/images/facebook.jpg',
                      title: 'Login With Facebook',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

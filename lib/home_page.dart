import 'package:flutter/material.dart';
import 'package:realestate/login_page.dart';
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 450,
            decoration: const BoxDecoration(
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
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: const Text('LOGIN'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(180, 50),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('REGISTER'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            minimumSize: const Size(180, 50),
                            side: BorderSide(width: 1, color: Colors.black)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 130,
                        height: 1,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
                      ),
                      const Text('or Login with'),
                      Container(
                        width: 130,
                        height: 1,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const SocialLoginButton(
                    image: 'assets/images/google.png',
                    title: 'Login With Google',
                  ),
                  const SizedBox(height: 15),
                  const SocialLoginButton(
                    image: 'assets/images/apple.png',
                    title: 'Login With Apple',
                  ),
                  const SizedBox(height: 15),
                  const SocialLoginButton(
                    image: 'assets/images/facebook.jpg',
                    title: 'Login With Facebook',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

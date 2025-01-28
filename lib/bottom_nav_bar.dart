import 'package:flutter/material.dart';
import 'package:realestate/screens/posts_page.dart';
import 'package:realestate/screens/home_page.dart';
import 'package:realestate/screens/notification_page.dart';
import 'package:realestate/screens/profile_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int indexPage = 0;
  final pages = const [
    HomePage(),
    PostPage(),
    NotificationPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (value) {
          setState(() {
            indexPage = value;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

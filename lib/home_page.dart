import 'package:flutter/material.dart';
import 'package:realestate/widgets/text_formfield.dart';
import 'package:realestate/widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ['All', 'Apartment', 'Duplex', 'Terrace', 'Plot', 'Bungalow'];
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: Image.asset('assets/images/realestate_logo.png'),
            // leading: Icon(Icons.menu),

            title: const Text(
              'Real Estate',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
              const SizedBox(width: 20),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            print(category);
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                          child: Chip(
                            backgroundColor: selectedCategory == category ? Colors.black : Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            label: Text(
                              category,
                              style: TextStyle(fontSize: 16, color: selectedCategory == category ? Colors.white : Colors.black),
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            side: const BorderSide(color: Colors.black),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const CustomTextWidget(
                  text: 'Discounted Properties',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      // final houses = house[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20), // Same radius as the Card
                                  child: Image.asset('assets/images/house1.jpg'),
                                ),
                                const CustomTextWidget(
                                  text: '\$3400',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                const CustomTextWidget(
                                  text: 'Nice house for sale',
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

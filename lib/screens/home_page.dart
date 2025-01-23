import 'package:flutter/material.dart';
import 'package:realestate/screens/detail_property_page.dart';
import 'package:realestate/models/dommy_properties.dart';
import 'package:realestate/models/property_model.dart';
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
          body: SingleChildScrollView(
            child: Padding(
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
                      itemCount: discountedProperties.length,
                      itemBuilder: (context, index) {
                        final PropertyModel discountedItem = discountedProperties[index] as PropertyModel;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailPropertyPage(
                                    property: discountedItem,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Same radius as the Card
                                    child: Image.asset(
                                      discountedItem.image,
                                      fit: BoxFit.cover,
                                      height: 170,
                                      width: 250,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomTextWidget(
                                    text: "₦${discountedItem.price}",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  CustomTextWidget(
                                    text: discountedItem.description,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CustomTextWidget(
                    text: 'New Properties',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true, // ensure Gridview works inside singlechildscrollview
                    physics: const NeverScrollableScrollPhysics(), // Disable inner scrolling
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 10, // space between columns
                      mainAxisSpacing: 15, // space between rows
                      childAspectRatio: 0.85, // width/height ration
                    ),
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final PropertyModel property = properties[index] as PropertyModel;
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailPropertyPage(property: property),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0), // Same radius as the Card
                                child: Image.asset(
                                  property.image,
                                  fit: BoxFit.cover,
                                  height: 150,
                                ),
                              ),
                              SizedBox(height: 5),
                              CustomTextWidget(
                                text: "₦${property.price}",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              CustomTextWidget(
                                text: property.description,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

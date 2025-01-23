import 'package:realestate/models/property_model.dart';

List<Map<String, dynamic>> jsonDataDiscounted = [
  {
    'id': '1',
    'title': '2 Bed Room Apartment',
    'description': 'A big nice house',
    'location': 'Maitama',
    'price': '20,000',
    'image': 'assets/images/house1.jpg',
    'category': 'Apartment'
  },
  {
    'id': '2',
    'title': '3 Bed Room Apartment',
    'description': 'A big nice house',
    'location': 'Lugbe',
    'price': '10,000',
    'image': 'assets/images/house2.jpg',
    'category': 'Duplex'
  },
  {
    'id': '3',
    'title': '4 Bed Room Apartment',
    'description': 'A big nice house',
    'location': 'Wuse',
    'price': '50,000',
    'image': 'assets/images/house6.jpg',
    'category': 'Terrace'
  },
];

List<PropertyModel> discountedProperties = jsonDataDiscounted.map((item) => PropertyModel.fromJson(item)).toList();

List<Map<String, dynamic>> jsonData = [
  {
    'id': '1',
    'title': '2 Bed Room Apartment',
    'description': 'A big nice house',
    'location': 'Maitama',
    'price': '20,000',
    'image': 'assets/images/house1.jpg',
    'category': 'Apartment'
  },
  {
    'id': '2',
    'title': '3 Bed Room Apartment',
    'description': 'A big nice house',
    'location': 'Lugbe',
    'price': '10,000',
    'image': 'assets/images/house2.jpg',
    'category': 'Duplex'
  },
  {
    'id': '3',
    'title': '4 Bed Room Apartment',
    'description': 'A big nice house',
    'location': 'Wuse',
    'price': '50,000',
    'image': 'assets/images/house6.jpg',
    'category': 'Terrace'
  },
  {
    'id': '4',
    'title': 'Duplex',
    'description': 'A big nice house',
    'location': 'Abuja',
    'price': '20,000',
    'image': 'assets/images/house4.jpg',
    'category': 'Apartment'
  },
  {
    'id': '5',
    'title': '4 Bed Room Apartment',
    'description': 'A big nice house',
    'location': 'Maitama',
    'price': '40,000',
    'image': 'assets/images/house1.jpg',
    'category': 'Bungalow'
  },
  {
    'id': '6',
    'title': '3 Bed Room Duplex',
    'description': 'A big nice house',
    'location': 'Abuja',
    'price': '20,000',
    'image': 'assets/images/house5.jpg',
    'category': 'Apartment'
  },
];

List<PropertyModel> properties = jsonData.map((item) => PropertyModel.fromJson(item)).toList();

class PropertyModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final String image;
  final String price;
  final String location;

  PropertyModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.price,
    required this.location,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      location: json['location'],
    );
  }
}

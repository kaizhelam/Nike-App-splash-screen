class DummyListModel {
  final int id;
  final String name;
  final double price;
  final String image;

  DummyListModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  static List<DummyListModel> dummyList = [
    DummyListModel(
      id: 1,
      name: 'Air Max',
      price: 199.99,
      image: 'assets/images/app_icon.png',
    ),
    DummyListModel(
      id: 2,
      name: 'Nike Revolution',
      price: 149.99,
      image: 'assets/images/app_icon.png',
    ),
    DummyListModel(
      id: 3,
      name: 'Nike Zoom',
      price: 179.99,
      image: 'assets/images/app_icon.png',
    ),
    DummyListModel(
      id: 4,
      name: 'Adidas Ultraboost',
      price: 119.99,
      image: 'assets/images/app_icon.png',
    ),
    DummyListModel(
      id: 5,
      name: 'Jordan Pants',
      price: 179.99,
      image: 'assets/images/app_icon.png',
    ),
    DummyListModel(
      id: 6,
      name: 'Nike Bag',
      price: 189.99,
      image: 'assets/images/app_icon.png',
    ),
    DummyListModel(
      id: 7,
      name: 'Puma Suede Classic',
      price: 129.99,
      image: 'assets/images/app_icon.png',
    ),
    DummyListModel(
      id: 8,
      name: 'Under Armour Shorts',
      price: 89.99,
      image: 'assets/images/app_icon.png',
    ),
    DummyListModel(
      id: 9,
      name: 'New Balance 574',
      price: 139.99,
      image: 'assets/images/app_icon.png',
    ),
    DummyListModel(
      id: 10,
      name: 'Converse Chuck Taylor',
      price: 109.99,
      image: 'assets/images/app_icon.png',
    ),
    DummyListModel(
      id: 11,
      name: 'Asics Gel-Kayano',
      price: 159.99,
      image: 'assets/images/app_icon.png',
    ),
    DummyListModel(
      id: 12,
      name: 'Vans Old Skool',
      price: 99.99,
      image: 'assets/images/app_icon.png',
    ),
  ];
}

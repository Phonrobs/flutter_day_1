class Menu {
  final int menuId;
  final String name;
  final String imageUrl;
  final double price;

  Menu({this.menuId, this.name, this.imageUrl, this.price});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      menuId: json['menuId'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
    );
  }
}

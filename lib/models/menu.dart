class Menu {
  int menuId;
  String name;
  String imageUrl;
  double price;

  Menu({this.menuId, this.name, this.imageUrl, this.price});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      menuId: json['menuId'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price']
    );
  }
}

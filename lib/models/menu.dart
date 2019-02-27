class Menu {
<<<<<<< HEAD
  final int menuId;
  final String name;
  final String imageUrl;
  final double price;
=======
  int menuId;
  String name;
  String imageUrl;
  double price;
>>>>>>> 3763a8547a8e6b084fa170a07cd6c1e2774d574d

  Menu({this.menuId, this.name, this.imageUrl, this.price});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      menuId: json['menuId'],
      name: json['name'],
      imageUrl: json['imageUrl'],
<<<<<<< HEAD
      price: json['price'],
=======
      price: json['price']
>>>>>>> 3763a8547a8e6b084fa170a07cd6c1e2774d574d
    );
  }
}

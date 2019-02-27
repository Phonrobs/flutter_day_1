class Order {
<<<<<<< HEAD
  final int orderId;
  final String username;
  final int menuId;
  final int quantity;
  final double totalPrice;
  final String telephone;
=======
  int orderId;
  String username;
  int menuId;
  double totalPrice;
  String telephone;
  int quantity;
>>>>>>> 3763a8547a8e6b084fa170a07cd6c1e2774d574d

  Order(
      {this.orderId,
      this.username,
      this.menuId,
<<<<<<< HEAD
      this.quantity,
      this.totalPrice,
      this.telephone});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'],
      username: json['username'],
      menuId: json['menuId'],
      quantity: json['quantity'],
      totalPrice: json['totalPrice'],
      telephone: json['telephone'],
    );
  }

=======
      this.totalPrice,
      this.quantity,
      this.telephone});
  
>>>>>>> 3763a8547a8e6b084fa170a07cd6c1e2774d574d
  Map<String, dynamic> toJson() {
    return {
      'orderId' :orderId,
      'username' :username,
      'menuId' :menuId,
<<<<<<< HEAD
      'quantity':quantity,
      'totalPrice':totalPrice,
      'telephone':telephone
=======
      'totalPrice' :totalPrice,
      'quantity' :quantity,
      'telephone' :telephone,
>>>>>>> 3763a8547a8e6b084fa170a07cd6c1e2774d574d
    };
  }
}

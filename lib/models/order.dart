class Order {
  final int orderId;
  final String username;
  final int menuId;
  final int quantity;
  final double totalPrice;
  final String telephone;

  Order(
      {this.orderId,
      this.username,
      this.menuId,
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

  Map<String, dynamic> toJson() {
    return {
      'orderId' :orderId,
      'username' :username,
      'menuId' :menuId,
      'quantity':quantity,
      'totalPrice':totalPrice,
      'telephone':telephone
    };
  }
}

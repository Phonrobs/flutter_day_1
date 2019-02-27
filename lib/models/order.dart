class Order {
  int orderId;
  String username;
  int menuId;
  double totalPrice;
  String telephone;
  int quantity;

  Order(
      {this.orderId,
      this.username,
      this.menuId,
      this.totalPrice,
      this.quantity,
      this.telephone});
  
  Map<String, dynamic> toJson() {
    return {
      'orderId' :orderId,
      'username' :username,
      'menuId' :menuId,
      'totalPrice' :totalPrice,
      'quantity' :quantity,
      'telephone' :telephone,
    };
  }
}

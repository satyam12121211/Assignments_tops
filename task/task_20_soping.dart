class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class Cart {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
    print("Added ${product.name} to the cart.");
  }

  double calculateTotal() {
    return products.fold(0, (total, product) => total + product.price);
  }
}

class Order {
  Cart cart;

  Order(this.cart);

  void checkout() {
    double total = cart.calculateTotal();
    print("Order placed. Total amount: $total");
  }
}

void main() {
  Product product1 = Product("Laptop", 1200.0);
  Product product2 = Product("Phone", 800.0);

  Cart cart = Cart();
  cart.addProduct(product1);
  cart.addProduct(product2);

  print("Total Price: ${cart.calculateTotal()}");

  Order order = Order(cart);
  order.checkout();
}

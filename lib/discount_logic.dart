/// This module represents the business logic layer.
/// It separates logic from the interface, which is a good software engineering practice.
class DiscountLogic {
  double calculate(double price, double discount) {
    if (price < 0 || discount < 0 || discount > 100) {
      throw Exception(
        'Invalid input: price and discount must be non-negative, and discount must not exceed 100.',
      );
    }

    double discountAmount = price * discount / 100;
    double finalPrice = price - discountAmount;
    return finalPrice;
  }
}

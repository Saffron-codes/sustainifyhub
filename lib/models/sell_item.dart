class SurplusProduct {
  // final int id;
  final String name;
  final int quantity;
  final String amountUnit;
  final String? expiryDetails;
  final bool? isFood;
  final int amount;

  const SurplusProduct({
    // required this.id,
    required this.name,
    required this.quantity,
    required this.amountUnit,
    this.expiryDetails,
    required this.isFood,
    required this.amount,
  });
}

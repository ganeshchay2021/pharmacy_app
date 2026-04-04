class PaymentModel {
  final int amount; // Amount in paisa
  final String productId;
  final String productName;
  final String? productUrl;
  final Map<String, String>? additionalData;

  PaymentModel({
    required this.amount,
    required this.productId,
    required this.productName,
    this.productUrl,
    this.additionalData,
  });
}
class ProductAttachment {
  final int id;
  final int productId;
  final String type;
  final String price;

  ProductAttachment({
    required this.id,
    required this.productId,
    required this.type,
    required this.price,
  });

  factory ProductAttachment.fromJson(Map<String, dynamic> json) {
    return ProductAttachment(
      id: json['id'],
      productId: json['product_id'],
      type: json['type'],
      price: json['price'],
    );
  }
}

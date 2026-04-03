class ProductModel {
  String? id;
  String? companyName;
  String? category;
  String? description;
  String? name;
  String? price;

  ProductModel({this.id, this.companyName, this.category, this.description, this.name, this.price});

  // Convert Firestore Document to Model
  factory ProductModel.fromMap(Map<String, dynamic> map, String docId) {
    return ProductModel(
      id: docId,
      companyName: map['Company Name'],
      category: map['Product Category'],
      description: map['Product Description'],
      name: map['Product Name'],
      price: map['Product Price'],
    );
  }
}
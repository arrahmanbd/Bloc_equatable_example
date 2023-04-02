class ProductModel {
  int? id;
  String? title;
  String? description;
  int? price;
  // double? discountPercentage;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  ProductModel(
      {this.id,
      this.title,
      this.description,
      this.price,
    
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    price = json["price"];
  
    stock = json["stock"];
    brand = json["brand"];
    category = json["category"];
    thumbnail = json["thumbnail"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
  }

  static List<ProductModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ProductModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["description"] = description;
    _data["price"] = price;
   
    _data["stock"] = stock;
    _data["brand"] = brand;
    _data["category"] = category;
    _data["thumbnail"] = thumbnail;
    if (images != null) {
      _data["images"] = images;
    }
    return _data;
  }
}

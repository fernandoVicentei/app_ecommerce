class Clothe{
  int? id;
  String? title;
  int? price;
  String? description;
  String? updatedAt;
  List<String>? images;

  Clothe({
         required this.id,
         required this.title, 
         required this.price, 
         required this.description, 
         required this.updatedAt, 
         required this.images
        });

   factory Clothe.fromJson(Map<String, dynamic> json) {
     List<String>? imageList = (json['images'] as List<dynamic>).cast<String>();
    return Clothe(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as int,
      description: json['description'] as String,
      updatedAt: json['updatedAt'] as String,
      images: imageList,
    );
  }

}
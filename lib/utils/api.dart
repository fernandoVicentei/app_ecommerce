import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_ecommerce/models/clothes.dart';

class Api {
  final url = 'https://api.escuelajs.co/api/v1/products';

  Future<List<Clothe>> getProducts(String value) async {
    String query = '$url?title=$value';
    var data = await http.get(Uri.parse(query));
    var response = json.decode(data.body);
    List<Clothe> products = [];
    for (var i in response) {
      Clothe objClothe = Clothe(
        id: i["id"],
        title: i["title"],
        price: i["price"],
        description: i["description"],
        updatedAt: i["updatedAt"],
        images: (i["images"] as List<dynamic>).cast<String>(),
      );
      products.add(objClothe);
    }
    return products;
  }
  
  Future<Clothe> getProduct(int value) async {
    String query = '$url/$value';
    var data = await http.get(Uri.parse(query));
    var response = json.decode(data.body);
    Clothe objClothe = Clothe(
        id: response["id"],
        title: response["title"],
        price: response["price"],
        description: response["description"],
        updatedAt: response["updatedAt"],
        images: (response["images"] as List<dynamic>).cast<String>(),
      );
    return objClothe;
  }
}

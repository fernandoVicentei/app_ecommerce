import 'package:shared_preferences/shared_preferences.dart';

bool isValidImageUrl(String url) {
    Uri? uri = Uri.tryParse(url);
    if (uri == null || !uri.isAbsolute) {
      return false;
    }
    String extension = uri.pathSegments.last.split('.').last.toLowerCase();
    List<String> imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
    return imageExtensions.contains(extension);
}

Future<List<String>> getVisiteds() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> visitedProducts = prefs.getStringList('visited_products_clothes') ?? [];
  return visitedProducts;
}

Future<void> saveVisiteds(String clotheId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> visitedProducts = prefs.getStringList('visited_products_clothes') ?? [];
  print(visitedProducts.toString());
  if (!visitedProducts.contains(clotheId)) {
    visitedProducts.insert(0, clotheId);
    if (visitedProducts.length > 5) {
      visitedProducts.removeLast();
    }
    prefs.setStringList('visited_products_clothes', visitedProducts);
  }
}
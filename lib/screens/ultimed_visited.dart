import 'package:app_ecommerce/models/clothes.dart';
import 'package:flutter/material.dart';
import 'package:app_ecommerce/utils/helper.dart';
import 'package:app_ecommerce/screens/detail_product.dart';

class UltimedVisited extends StatelessWidget {
  final List<Clothe> visitedClothes;
  UltimedVisited({required this.visitedClothes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Últimos Productos Visitados:',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: visitedClothes.length,
            itemBuilder: (context, index) {
              String imageUrl = visitedClothes[index].images![0];
              bool isValidImage = isValidImageUrl(imageUrl);
              return ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                title: Text(
                  visitedClothes[index].title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Bs. ${visitedClothes[index].price!}',
                  style: const TextStyle(
                    color: Colors.white60,
                  ),
                ),
                leading: isValidImage
                    ? Image.network(Uri.parse(imageUrl).toString())
                    : const Icon(Icons.warning, color: Colors.red),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailProduct(clothe: visitedClothes[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

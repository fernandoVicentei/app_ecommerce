import 'package:flutter/material.dart';
import 'package:app_ecommerce/models/clothes.dart';
import 'package:app_ecommerce/screens/detail_product.dart';
import 'package:app_ecommerce/screens/ultimed_visited.dart';
import 'package:app_ecommerce/utils/api.dart';
import 'package:app_ecommerce/utils/helper.dart';

class MySearch extends StatefulWidget {
  const MySearch({super.key});

  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  final api = Api();
  bool isEnter = true;
  List<Clothe> showList = [];
  List<Clothe> listVisited = [];

  @override
  void initState() {
    super.initState();
    changeListUltimatedProducts();
  }

  void changeListUltimatedProducts() async {
    List<String> listIds = await getVisiteds();
    List<Clothe> listLocal = [];
    for (String id in listIds as List) {
      var response = await api.getProduct(int.parse(id));
      listLocal.add(response);
    }
    setState(() {
      listVisited = listLocal;
    });
  }

  Future<void> updateProducts(String value) async {
    List<Clothe> showListLocal = [];
    isEnter = false;
    var response = await api.getProducts(value);
    showListLocal.addAll(response);
    setState(() {
      showList = showListLocal;
    });
  }

  void setClickEnter(String value) {
    setState(() {
      if (value.isEmpty) {
        showList = [];
      }
      isEnter = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: const Color(0xff1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Busca un producto",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateProducts(value),
              onSubmitted: (value) => setClickEnter(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Ingresa un nombre de una ropa",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.white,
              ),
            ),
            const Text(
              "(Presiona Enter para obtener los resultados.)",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: (showList.isEmpty && !isEnter)
                  ? const Center(
                      child: Text("Sin productos encontrados.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          )))
                  : !isEnter
                      ? ListView.builder(
                          itemCount: showList.length,
                          itemBuilder: (context, index) {
                            String imageUrl = showList[index].images![0];
                            bool isValidImage = isValidImageUrl(imageUrl);
                            return ListTile(
                              contentPadding: const EdgeInsets.all(8.0),
                              title: Text(
                                showList[index].title!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'Bs. ${showList[index].price!}',
                                style: const TextStyle(
                                  color: Colors.white60,
                                ),
                              ),
                              leading: isValidImage
                                  ? Image.network(
                                      Uri.parse(imageUrl).toString())
                                  : const Icon(Icons.warning,
                                      color: Colors.red),
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailProduct(
                                            clothe: showList[index])))
                              },
                            );
                          },
                        )
                      : 
                        (showList.isEmpty) 
                        ?                             
                            listVisited.isEmpty ?
                            const Center(
                                    child: Text(
                                      'Sin productos encontrados.',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        )   ,
                                    ),
                              )
                            :
                            UltimedVisited(visitedClothes: listVisited)                           
                        :
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 5.0,
                          ),
                          itemCount: showList.length,
                          itemBuilder: (context, index) {
                            /* if (showList.isEmpty) {
                              if (listVisited.isEmpty) {
                                return const Center(
                                    child: Text(
                                      'Sin productos encontrados.',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        )   ,
                                    ),
                                  );
                              } else {
                                 return UltimedVisited(visitedClothes: listVisited);
                              }
                            } */
                            Clothe product = showList[index];
                            String imageUrlGrid = showList[index].images![0];
                            bool isValidImage = isValidImageUrl(imageUrlGrid);
                            return GridTile(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailProduct(
                                              clothe: showList[index])));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.title.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 5.0),
                                      Text(
                                          'Bs. ${product.price?.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0)),
                                      const SizedBox(height: 5.0),
                                      isValidImage
                                          ? Center(
                                              child: Image.network(imageUrlGrid,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.contain))
                                          : const Center(
                                              child: Icon(
                                              Icons.warning,
                                              color: Colors.red,
                                              size: 50,
                                            ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

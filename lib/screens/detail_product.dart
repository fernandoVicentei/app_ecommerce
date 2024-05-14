import 'package:flutter/material.dart';
import 'package:app_ecommerce/models/clothes.dart';
import 'package:app_ecommerce/utils/helper.dart';
import 'dart:math';

class DetailProduct extends StatefulWidget {
  final Clothe clothe;
  DetailProduct({required this.clothe});

  @override
  _DetailProductState createState() => _DetailProductState(clothe: clothe);
}

class _DetailProductState extends State<DetailProduct> {
  final Clothe clothe;
  String imageUrl = '';
 _DetailProductState({required this.clothe});

  @override
  void initState() {
    super.initState();
    imageUrl = clothe.images!.isEmpty ? '' : clothe.images![0];
    saveIdProduct(clothe.id);
  }

  void saveIdProduct(int? id) async{
    await saveVisiteds(id.toString());
  }

  void changeImage(String url) {
    setState(() {
      imageUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Informacion',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 350,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                color: Colors.grey.shade100,
                child: Builder(
                  builder: (BuildContext context) {
                    bool isValidImg = isValidImageUrl(imageUrl);
                    return isValidImg
                        ? Image.network(
                            imageUrl,
                            width: 300,
                            height: 300,
                            fit: BoxFit.contain,
                          )
                        : const Icon(Icons.warning, color: Colors.red);
                  },
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: Color(0xff302360),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0;
                              i <  min(3, (clothe.images as List).length);
                              i++)
                            Builder(
                              builder: (BuildContext context) {
                                String imageUrl = clothe.images![i];
                                bool isValidImage = isValidImageUrl(imageUrl);
                                return Container(
                                  padding: const EdgeInsets.all(4),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: isValidImage
                                      ? GestureDetector(
                                          onTap: () => changeImage(imageUrl),
                                          child: Image.network(imageUrl,
                                              width: 55),
                                        )
                                      : const Icon(Icons.warning,
                                          color: Colors.red),
                                );
                              },
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            clothe.title.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                          const SizedBox(width: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Bs. " + clothe.price.toString(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        clothe.description.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              )))
            ],
          ),
        ),
      ]),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:laza_commerce/Core/Models/product_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(model.image ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYscfUBUbqwGd_DHVhG-ZjCOD7MUpxp4uhNe7toUg4ug&s'))),
            ),
          ],
        ),
      ),
    );
  }
}

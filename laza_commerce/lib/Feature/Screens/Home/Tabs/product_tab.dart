import 'package:flutter/material.dart';
import 'package:laza_commerce/Core/Bloc/Home/home_cubit.dart';

import '../../../../Core/Models/category_model.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key, required this.state});
  final HomeSuccess state;
  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  @override
  Widget build(BuildContext context) {
    String? _chosenModel = widget.state.categoryList.first.name;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
                  child: const Padding(padding: EdgeInsets.all(16), child: Icon(Icons.arrow_back)),
                ),
              ),
              const Spacer(),
              const Text(
                "Add Product",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Select Category",
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.grey)), 
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.grey))),
                value: _chosenModel,
                items: widget.state.categoryList.map<DropdownMenuItem<String>>((CategoryModel value) {
                  return DropdownMenuItem<String>(

                    value: value.name,
                    child: Text(
                      value.name ?? 'Test',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _chosenModel = newValue;
                  });
                },
                
                hint: const Text(
                  "Choose a Car Model",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

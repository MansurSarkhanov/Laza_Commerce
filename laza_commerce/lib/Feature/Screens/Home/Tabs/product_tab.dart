import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laza_commerce/Core/Bloc/Home/home_cubit.dart';
import 'package:laza_commerce/Feature/Animations/bounce_animation.dart';

import '../../../../Core/Models/category_model.dart';
import '../../../../Core/Service/firebase_storage_service.dart';
import '../../../Components/Painter/dash_painter.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key, required this.state});
  final HomeSuccess state;
  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  final storage = FirebaseStorageService();
  DateTime date = DateTime.now();
  late var formattedDateStart;
  late var formattedDateEnd;

  @override
  void initState() {
    super.initState();
    formattedDateStart = DateFormat('d-MMM-yyyy').format(date);
    formattedDateEnd = DateFormat('d-MMM-yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    String? chosenModel = widget.state.categoryList.first.name;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: SingleChildScrollView(
        child: BounceFromBottomAnimation(
          delay: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              BounceFromBottomAnimation(
                delay: 3,
                child: Row(
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
              ),
              const SizedBox(height: 20),
              BounceFromBottomAnimation(
                delay: 3,
                child: Column(
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
                    BounceFromBottomAnimation(
                      delay: 4,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(color: Colors.grey))),
                        value: chosenModel,
                        items: widget.state.categoryList.map<DropdownMenuItem<String>>((CategoryModel value) {
                          return DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(
                              value.name ?? 'Test',
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            chosenModel = newValue;
                          });
                        },
                        hint: const Text(
                          "Choose a Car Model",
                          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    BounceFromBottomAnimation(
                      delay: 4,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20), color: Theme.of(context).hoverColor),
                          child: storage.selectedFile != null
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: MemoryImage(
                                                storage.selectedImgeByte!,
                                              )),
                                          color: const Color.fromARGB(255, 223, 223, 225),
                                        ),
                                      ),
                                      TextButton(
                                        child: const Text('Change Photo'),
                                        onPressed: () async {
                                          await storage.pickImage();

                                          setState(() {});
                                        },
                                      )
                                    ],
                                  ),
                                )
                              : InkWell(
                                  onTap: () async {
                                    await storage.pickImage();

                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Card(
                                      child: CustomPaint(
                                        painter: DashedBorderPainter(),
                                        child: Container(
                                          width: double.infinity,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                20.0), // İstediğiniz kenar yuvarlaklığını ayarlayabilirsiniz.
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.add_a_photo_outlined,
                                              size: 32,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    BounceFromBottomAnimation(
                      delay: 4,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Start Date*",
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: date,
                                            firstDate: DateTime(2020, 9, 7, 17, 30),
                                            lastDate: DateTime(2030, 9, 7, 17, 30))
                                        .then((selectedDate) => {
                                              setState(() {
                                                date = selectedDate!;
                                                formattedDateStart = DateFormat('d-MMM-yyyy').format(selectedDate);
                                              })
                                            });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: Colors.grey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [Text(formattedDateStart), const Icon(Icons.date_range)],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Expiration date*",
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: date,
                                            firstDate: DateTime(2020, 9, 7, 17, 30),
                                            lastDate: DateTime(2030, 9, 7, 17, 30))
                                        .then((selectedDate) => {
                                              setState(() {
                                                date = selectedDate!;
                                                formattedDateEnd = DateFormat('d-MMM-yyyy').format(selectedDate);
                                              })
                                            });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: Colors.grey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [Text(formattedDateEnd), const Icon(Icons.date_range)],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const BounceFromBottomAnimation(
                        delay: 4,
                        child: Card(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  "Prduct name",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        )),
                    const BounceFromBottomAnimation(
                      delay: 4,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Product Information",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              TextField(
                                maxLines: 7,
                                maxLength: 100,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Description...",
                                    hintStyle: TextStyle(fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    BounceFromBottomAnimation(
                      delay: 4,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Center(
                                child: Text(
                              "Submit",
                              style: TextStyle(fontSize: 16),
                            )),
                          )),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

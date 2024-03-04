import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:laza_commerce/Core/Bloc/Home/home_cubit.dart';
import 'package:laza_commerce/Core/Models/product_model.dart';
import 'package:laza_commerce/Feature/Animations/bounce_animation.dart';
import 'package:laza_commerce/Feature/Screens/Home/Widgets/pick_image_card.dart';
import 'package:laza_commerce/Feature/Screens/Home/Widgets/select_category.dart';
import 'package:laza_commerce/Product/Utility/Mixin/home_product_tab_mixin.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../Core/Provider/home_provider.dart';
import '../../../../Core/Service/firebase_storage_service.dart';
import '../Widgets/app_bar_item.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key, required this.state});
  final HomeSuccess state;
  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> with HomeProductTabMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final storage = FirebaseStorageService();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: SingleChildScrollView(
        child: BounceFromBottomAnimation(
          delay: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              const AppBarItem(),
              const SizedBox(height: 16),
              BounceFromBottomAnimation(
                delay: 3,
                child: Column(
                  children: [
                    SelectCategorySection(state: widget.state),
                    const SizedBox(
                      height: 16,
                    ),
                    PickImageCard(storage: storage),
                    const SizedBox(
                      height: 16,
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
                    BounceFromBottomAnimation(
                        delay: 4,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Prduct name :",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: TextField(
                                    controller: _nameController,
                                    decoration: const InputDecoration(
                                      hintText: "Enter name",
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    BounceFromBottomAnimation(
                        delay: 4,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Prduct price :",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: TextField(
                                    keyboardType: TextInputType.phone,
                                    controller: _priceController,
                                    decoration: const InputDecoration(
                                      hintText: "Enter Price",
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    BounceFromBottomAnimation(
                      delay: 4,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Product Information",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              TextField(
                                controller: _descriptionController,
                                maxLines: 7,
                                maxLength: 100,
                                decoration: const InputDecoration(
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
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return BounceFromBottomAnimation(
                          delay: 4,
                          child: Consumer(builder: (context, HomeProvider provider, child) {
                            return ElevatedButton(
                                onPressed: () async {
                                  provider.changeLoading();
                                  await storage.uploadImage("products");
                                  final model = ProductModel(
                                      category: context.watch<HomeCubit>().chosenModel,
                                      name: _nameController.text,
                                      description: _descriptionController.text,
                                      start_date: formattedDateStart,
                                      expiration_date: formattedDateEnd,
                                      price: _priceController.text,
                                      username: widget.state.user.username,
                                      image: storage.imageUrl,
                                      id: const Uuid().v4(),
                                      usernameId: widget.state.user.uid);
                                  context.read<HomeCubit>().sendProduct(model);
                                  provider.changeLoading();

                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  child: Center(
                                      child: provider.isProductSend
                                          ? const CircularProgressIndicator()
                                          : const Text(
                                              "Submit",
                                              style: TextStyle(fontSize: 16),
                                            )),
                                ));
                          }),
                        );
                      },
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_commerce/Core/Bloc/Home/home_cubit.dart';

import '../../../../Core/Models/category_model.dart';
import '../../../Animations/bounce_animation.dart';

class SelectCategorySection extends StatefulWidget {
  const SelectCategorySection({super.key, required this.state});
  final HomeSuccess state;

  @override
  State<SelectCategorySection> createState() => _SelectCategorySectionState();
}

class _SelectCategorySectionState extends State<SelectCategorySection> {
  @override
  Widget build(BuildContext context) {
    context.watch<HomeCubit>().chosenModel = widget.state.categoryList.first.name;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Category",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        BounceFromBottomAnimation(
          delay: 4,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.grey))),
            value: context.watch<HomeCubit>().chosenModel,
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
                context.watch<HomeCubit>().chosenModel = newValue;
              });
            },
            hint: const Text(
              "Choose a Car Model",
              style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

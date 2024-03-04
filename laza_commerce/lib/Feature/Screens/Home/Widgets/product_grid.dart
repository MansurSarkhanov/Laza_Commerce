import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../Core/Bloc/Home/home_cubit.dart';
import '../../../Animations/bounce_animation.dart';
import '../Detail/detail_page.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    required this.state,
  });

  final HomeSuccess state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BounceFromBottomAnimation(
          delay: 3,
          child: GridView.builder(
            itemCount: state.productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 10 / 16, crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.route.navigateToPage(DetailPage(
                    model: state.productList[index],
                  ));
                },
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(state.productList[index].image ??
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYscfUBUbqwGd_DHVhG-ZjCOD7MUpxp4uhNe7toUg4ug&s'))),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(state.productList[index].name ?? ''),
                      Text(state.productList[index].price ?? ''),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}

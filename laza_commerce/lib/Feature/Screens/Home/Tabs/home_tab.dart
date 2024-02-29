import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

import '../../../../Core/Bloc/Home/home_cubit.dart';
import '../../../../Product/Constants/Paths/icon_path.dart';
import '../../../Animations/bounce_animation.dart';
import '../../../Components/Inputs/custom_searchfield.dart';
import '../Detail/detail_page.dart';
import '../home_page.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
    required this.state,
  });
  final HomeSuccess state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      IconPath.menu.toPathSvg(),
                      width: 12,
                      height: 12,
                    ),
                  ),
                ),
              ),
              ProfileImage(
                state: state,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Hello ",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            "Welcome to Laza.",
            style: TextStyle(color: Colors.grey.shade500),
          ),
          const SizedBox(height: 20),
          const BounceFromBottomAnimation(delay: 3, child: CustomSearchField()),
          const SizedBox(
            height: 20,
          ),
          BounceFromBottomAnimation(
            delay: 3,
            child: CategorySection(
              state: state,
            ),
          ),
          Expanded(
            child: BounceFromBottomAnimation(
                delay: 3,
                child: GridView.builder(
                  itemCount: state.productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 10 / 16, crossAxisCount: 2, crossAxisSpacing: 16),
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
          )
        ],
      ),
    );
  }
}

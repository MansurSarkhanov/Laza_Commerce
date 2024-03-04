import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Core/Bloc/Home/home_cubit.dart';
import '../../../../Product/Constants/Paths/icon_path.dart';
import '../../../Animations/bounce_animation.dart';
import '../../../Components/Inputs/custom_searchfield.dart';
import '../Widgets/product_grid.dart';
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
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
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
          const SizedBox(height: 12),
          Text(
            "Hello ",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            "Welcome to Laza.",
            style: TextStyle(color: Colors.grey.shade500),
          ),
          const SizedBox(height: 12),

          const BounceFromBottomAnimation(delay: 3, child: CustomSearchField()),
          const SizedBox(height: 12),

          BounceFromBottomAnimation(
            delay: 3,
            child: CategorySection(
              state: state,
            ),
          ),
          ProductGridView(state: state)
        ],
      ),
    );
  }
}

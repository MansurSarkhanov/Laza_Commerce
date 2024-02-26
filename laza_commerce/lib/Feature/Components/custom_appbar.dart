import 'package:flutter/material.dart';
import 'package:laza_commerce/Feature/Animations/bounce_animation.dart';

import '../../Product/Constants/Paths/image_path.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // automaticallyImplyLeading: false,
      // title: BounceFromBottomAnimation(
      //   delay: 3,
      //   child: InkWell(
      //     child: Container(
      //       decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
      //       child: Padding(
      //         padding: const EdgeInsets.all(20),
      //         child: SvgPicture.asset(
      //           IconPath.menu.toPathSvg(),
      //           width: 12,
      //           height: 12,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      actions: [
        BounceFromBottomAnimation(
          delay: 3,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                  image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(ImagePath.emptyImageUrl))),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

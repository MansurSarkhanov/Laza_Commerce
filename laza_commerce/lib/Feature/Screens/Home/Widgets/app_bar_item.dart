import 'package:flutter/material.dart';

import '../../../Animations/bounce_animation.dart';

class AppBarItem extends StatelessWidget {
  const AppBarItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BounceFromBottomAnimation(
      delay: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Add Product",
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

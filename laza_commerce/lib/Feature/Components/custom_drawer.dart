import 'dart:ui' show ImageFilter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_commerce/Core/Bloc/Home/home_cubit.dart';
import 'package:laza_commerce/Feature/Animations/bounce_animation.dart';
import 'package:laza_commerce/Feature/Screens/Home/home_page.dart';
import 'package:laza_commerce/Product/Constants/Paths/icon_path.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.state,
  });
  final HomeSuccess state;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.75,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BounceFromBottomAnimation(
            delay: 3,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Scaffold.of(context).closeDrawer();
                      },
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
                        child: const Padding(
                            padding: EdgeInsets.all(14),
                            child: Icon(
                              Icons.close,
                              size: 18,
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ProfileImage(
                      state: state,
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.username ?? '',
                          style: const TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: 150,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              state.user.email ?? '',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                _DrawerSelection(
                  isShowSwitch: true,
                  imagePath: IconPath.sun.toPathSvg(),
                  title: "Dark Mode",
                ),
                _DrawerSelection(
                  imagePath: IconPath.info.toPathSvg(),
                  title: "Account Information",
                ),
                _DrawerSelection(
                  imagePath: IconPath.lock.toPathSvg(),
                  title: "Password",
                ),
                _DrawerSelection(
                  imagePath: IconPath.bagdrawer.toPathSvg(),
                  title: "Order",
                ),
                _DrawerSelection(
                  imagePath: IconPath.favoritedrawer.toPathSvg(),
                  title: "Favorite",
                ),
                _DrawerSelection(
                  imagePath: IconPath.setting.toPathSvg(),
                  title: "Settings",
                ),
                const Spacer(
                  flex: 2,
                ),
                _DrawerSelection(
                  imagePath: IconPath.logout.toPathSvg(),
                  title: "Logout",
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DrawerSelection extends StatelessWidget {
  const _DrawerSelection({
    Key? key,
    required this.title,
    this.isShowSwitch = false,
    required this.imagePath,
  }) : super(key: key);
  final String title;
  final bool isShowSwitch;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return BounceFromBottomAnimation(
      delay: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            SvgPicture.asset(imagePath),
            const SizedBox(
              width: 10,
            ),
            Text(title),
            const Spacer(),
            isShowSwitch
                ? SizedBox(
                    height: 30,
                    width: 45,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: CupertinoSwitch(
                          activeColor: Colors.green,
                          value: false,
                          onChanged: (bool value) {},
                        )),
                  )
                : const SizedBox(
                    height: 30,
                  )
          ],
        ),
      ),
    );
  }
}

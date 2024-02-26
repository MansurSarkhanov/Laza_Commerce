import 'dart:ui' show ImageFilter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_commerce/Core/Bloc/Home/home_cubit.dart';
import 'package:laza_commerce/Feature/Screens/Home/home_page.dart';
import 'package:laza_commerce/Product/Constants/Paths/icon_path.dart';

import '../../Product/Constants/app_colors.dart';

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
        width: MediaQuery.of(context).size.width * 0.7,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
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
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        state.user.email ?? '',
                        style: const TextStyle(color: Colors.grey),
                      ),
                     
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(IconPath.sun.toPathSvg()),
                  const Text("Dark Mode"),
                  SizedBox(
                    height: 30,
                    width: 45,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: CupertinoSwitch(
                          activeColor: AppColors.primaryColor,
                          value: true,
                          onChanged: (bool value) {},
                        )),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(IconPath.sun.toPathSvg()),
                  const Text("Dark Mode"),
                  SizedBox(
                    height: 30,
                    width: 45,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: CupertinoSwitch(
                          activeColor: AppColors.primaryColor,
                          value: true,
                          onChanged: (bool value) {},
                        )),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(IconPath.sun.toPathSvg()),
                  const Text("Dark Mode"),
                  SizedBox(
                    height: 30,
                    width: 45,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: CupertinoSwitch(
                          activeColor: AppColors.primaryColor,
                          value: true,
                          onChanged: (bool value) {},
                        )),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(IconPath.sun.toPathSvg()),
                  const Text("Dark Mode"),
                  SizedBox(
                    height: 30,
                    width: 45,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: CupertinoSwitch(
                          activeColor: AppColors.primaryColor,
                          value: true,
                          onChanged: (bool value) {},
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

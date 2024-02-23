import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_commerce/Product/Constants/Paths/icon_path.dart';

import '../../Components/Inputs/custom_searchfield.dart';
import '../../Components/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: _tabBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20),
            child: Text(
              "Hello ",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Welcome to Laza.",
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomSearchField(),
          )
        ],
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(controller: _tabController, tabs: [
      Tab(
        text: "Home",
        icon: SvgPicture.asset(IconPath.home.toPathSvg()),
      ),
      Tab(
        text: "Favorite",
        icon: SvgPicture.asset(IconPath.favorite.toPathSvg()),
      ),
      Tab(
        text: "Bag",
        icon: SvgPicture.asset(IconPath.bag.toPathSvg()),
      ),
      Tab(
        text: "Product",
        icon: SvgPicture.asset(IconPath.product.toPathSvg()),
      ),
    ]);
  }
}

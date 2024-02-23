import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_commerce/Product/Constants/Paths/icon_path.dart';

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
      bottomNavigationBar: TabBar(controller: _tabController, tabs: [
        Tab(
          text: "Home",
          icon: SvgPicture.asset(IconPath.home),
        ),
        Tab(
          text: "Favorite",
          icon: SvgPicture.asset(IconPath.favorite),
        ),
        Tab(
          text: "Bag",
          icon: SvgPicture.asset(IconPath.bag),
        ),
        Tab(
          text: "Product",
          icon: SvgPicture.asset(IconPath.product),
        ),
      ]),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}

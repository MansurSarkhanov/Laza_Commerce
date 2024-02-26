import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_commerce/Core/Bloc/Home/home_cubit.dart';
import 'package:laza_commerce/Product/Constants/Paths/icon_path.dart';

import '../../Animations/bounce_animation.dart';
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
    context.read<HomeCubit>().fetchAllProducts();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: _tabBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeProgress) {
            return const CircularProgressIndicator();
          } else if (state is HomeFailure) {
            return const Center(
              child: Text("error"),
            );
          } else if (state is HomeSuccess) {
            return BounceFromBottomAnimation(
              delay: 3,
              child: Column(
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
                    child: BounceFromBottomAnimation(delay: 3, child: CustomSearchField()),
                  ),
                  Expanded(
                    child: BounceFromBottomAnimation(
                        delay: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: GridView.builder(
                            itemCount: state.productList.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, crossAxisSpacing: 16),
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.amber,
                                height: 400,
                                child: Column(
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
                                    Text(state.productList[index].name ?? '')
                                  ],
                                ),
                              );
                            },
                          ),
                        )),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("Loding"),
            );
          }
        },
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        controller: _tabController,
        tabs: [
          _buildTab(icon: IconPath.home.toPathSvg(), index: 0, title: "Home"),
          _buildTab(icon: IconPath.favorite.toPathSvg(), index: 1, title: "Favorite"),
          _buildTab(icon: IconPath.bag.toPathSvg(), index: 2, title: "Bag"),
          _buildTab(icon: IconPath.product.toPathSvg(), index: 3, title: "Product"),
        ]);
  }

  Tab _buildTab({required String icon, required String title, required int index}) {
    Color iconColor = index == selectedIndex ? Theme.of(context).colorScheme.primary : Colors.grey;
    return Tab(
      text: title,
      icon: SvgPicture.asset(
        icon,
        color: iconColor,
      ),
    );
  }
}

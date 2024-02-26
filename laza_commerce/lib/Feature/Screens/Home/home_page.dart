import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_commerce/Core/Bloc/Home/home_cubit.dart';
import 'package:laza_commerce/Product/Constants/Paths/icon_path.dart';

import '../../../Product/Constants/Paths/image_path.dart';
import '../../Animations/bounce_animation.dart';
import '../../Components/Inputs/custom_searchfield.dart';

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
     
      bottomNavigationBar: _tabBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeFailure) {
            return const Center(
              child: Text("error"),
            );
          } else if (state is HomeSuccess) {
            return BounceFromBottomAnimation(
              delay: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
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
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: NetworkImage(state.user.image ?? ImagePath.emptyImageUrl))),
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
                    Expanded(
                      child: BounceFromBottomAnimation(
                          delay: 3,
                          child: GridView.builder(
                            itemCount: state.productList.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 10 / 16, crossAxisCount: 2, crossAxisSpacing: 16),
                            itemBuilder: (context, index) {
                              return SizedBox(
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
                              );
                            },
                          )),
                    )
                  ],
                ),
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

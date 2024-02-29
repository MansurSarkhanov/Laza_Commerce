import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_commerce/Core/Bloc/Home/home_cubit.dart';
import 'package:laza_commerce/Product/Constants/Paths/icon_path.dart';

import '../../../Product/Constants/Paths/image_path.dart';
import '../../Animations/bounce_animation.dart';
import '../../Components/custom_drawer.dart';
import 'Tabs/home_tab.dart';
import 'Tabs/product_tab.dart';

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
      drawer: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return CustomDrawer(
              state: state,
            );
          }
          return IconButton(onPressed: () {}, icon: const Icon(Icons.menu));
        },
      ),
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
              child: TabBarView(
                controller: _tabController,
                children: [
                  HomeTab(
                    state: state,
                  ),
                  _homeTabView(context, state),
                  _homeTabView(context, state),
                  ProductTab(
                    state: state,
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

  Widget _homeTabView(BuildContext context, HomeSuccess state) {
    return Container();
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


class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.state,
  });
  final HomeSuccess state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Categories",
              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width - 40,
          child: ListView.builder(
            itemCount: state.categoryList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 235, 236, 236), borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.categoryList[index].name ?? 'dsfsdfs'),
                  )),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.state,
    this.height = 45,
    this.width = 45,
  });
  final HomeSuccess state;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(state.user.image ?? ImagePath.emptyImageUrl))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shopping_app/core/data.dart';
import 'package:shopping_app/core/utils.dart';
import 'package:shopping_app/shopping_app/product_grid/product_grid.dart';
import 'package:shopping_app/shopping_app/product_grid/product_grid_3x3.dart';
import 'package:shopping_app/shopping_app/product_slider/presentation/product_slider.dart';

List<String> titles = [
  "Women's Fashions Sneakers",
  "Tablets Under \$100",
  "Popular Gifts in Camera",
  "Health & Beauty Products",
  "Top products in Camera",
  "Girls' everyday essentials",
  "Our favorite Toys",
  "Best sellers in Electronics",
  "Must have Baby products",
  "Games under \$10",
  "Tech Accessories under \$10",
  "Discount Electronics",
  "Gaming merchandise"
];
List<List<String>> urls = [
  womenFashionImgUrls,
  tabletsUnder100dollars,
  popularGiftsInCamera,
  healthAndBeautyProducts,
  topProductsInCamera,
  girlsEverydayEssentials,
  ourFavoriteToys,
  bestSellerForElectronics,
  mustHaveBabyProducts,
  gamesUnder10Dollars,
  techAccessoriesUnder10Dollars,
  techAccessoriesUnder10Dollars,
  discountElectronics,
  gamingMerchandise
];

class HomePageViewer extends StatelessWidget {
  const HomePageViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScrollToIndexCubit(),
        ),
        BlocProvider(
          create: (context) => SelectCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => SelectSizeCubit(),
        )
      ],
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final itemController = ItemScrollController();
  @override
  void initState() {
    super.initState();
  }

  void scrollToIndex(int index) {
    itemController.scrollTo(
      index: index,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scrollItemIndex = context.watch<ScrollToIndexCubit>().state;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => scrollToIndex(scrollItemIndex),
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 195, 195),
      body: Column(
        children: [
          Stack(
            children: [
              screenBackground(),
              deliveryLogo(),
              slider(
                const ProductSlider(),
              ),
            ],
          ),
          Expanded(
            child: ScrollablePositionedList.builder(
                itemScrollController: itemController,
                itemCount: 13,
                itemBuilder: (context, index) {
                  return index == 3 || index == 4
                      ? ProductGridPage3x3(
                          title: titles[index],
                          imgUrl: urls[index],
                          indexOfSet: index)
                      : ProductGridPage(
                          indexOfSet: index,
                          title: titles[index],
                          imgUrl: urls[index],
                        );
                }),
          ),
        ],
      ),
    );
  }

  SizedBox slider(Widget child) => SizedBox(
        height: getHeightRatio(context, 0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            child,
          ],
        ),
      );
  Container screenBackground() => Container(
        height: getHeightRatio(context, 0.5),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 1, 20, 36), Colors.white]),
        ),
      );
  SizedBox deliveryLogo() => SizedBox(
        width: getWidth(context),
        height: getHeightRatio(context, 0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset(
                'assets/image.png',
                width: getWidthRatio(context, 0.6),
                height: getWidthRatio(context, 0.6),
              ),
            ),
          ],
        ),
      );
}

class ScrollToIndexCubit extends Cubit<int> {
  ScrollToIndexCubit() : super(0);
  void scrollToItem(int item) => emit(item);
}

class SelectCategoryCubit extends Cubit<int> {
  SelectCategoryCubit() : super(0);
  void selectCategory(int index) {
    emit(index);
  }
}

class SelectSizeCubit extends Cubit<String> {
  SelectSizeCubit() : super("");
  void selectSize(String size) {
    emit(size);
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/common/constants.dart';
import 'package:frontend/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> sortBy = ['Price Ascending', 'Proice Descending', 'none'];
  SortTypes? sortType;
  String? sortValue;
  String? searchValue;
  int pagesNum = 0;
  int nextPage = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<ProductProvider>(context, listen: false)
          .getProducts(0, null, null, GetTypes.PAGING);

      pagesNum =
          Provider.of<ProductProvider>(context, listen: false).pagesNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: APP_COLOR,
        title: const Text(
          "axnd Ecommerce 🚀",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: const [SizedBox()],
      ),
    );
  }
}

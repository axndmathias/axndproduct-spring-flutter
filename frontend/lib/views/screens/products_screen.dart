import 'package:flutter/material.dart';
import 'package:frontend/common/constants.dart';
import 'package:frontend/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/add_product_drawer.dart';
import '../widgets/custom_elevated_button.dart';

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
      endDrawer: const AddProductDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Products 💸",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                CustomElevatedButton(
                  text: "Add Product",
                  icon: Icons.add,
                  onPressed: () {
                    Provider.of<ProductProvider>(context, listen: false)
                        .productToEdit = null;
                    _scaffoldKey.currentState!.openEndDrawer();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 180,
                  child: TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      hintText: "search by name...",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (input) {
                      searchValue = input;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 160,
                  child: DropdownButton(
                    hint: const Text("Sort By"),
                    value: sortValue,
                    items: sortBy.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      sortValue = value as String?;
                      if (value == sortBy[0]) {
                        sortType = SortTypes.ASC;
                      } else if (value == sortBy[1]) {
                        sortType = SortTypes.DESC;
                      } else {
                        sortType = null;
                      }
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 10),
                CustomElevatedButton(
                  text: "Filter",
                  icon: Icons.filter_list,
                  color: Colors.black87,
                  onPressed: () {
                    Provider.of<ProductProvider>(context, listen: false)
                        .getProducts(0, searchValue, sortType, GetTypes.FILTER);
                    pagesNum =
                        Provider.of<ProductProvider>(context, listen: false)
                            .pagesNumber;
                    nextPage = 1;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

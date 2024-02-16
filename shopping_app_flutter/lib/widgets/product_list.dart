import 'package:flutter/material.dart';

import '../utils/globel_variables.dart';
import 'product_card.dart';
import '../pages/products_detailts_page.dart';

class ProductListViewController extends StatefulWidget {
  const ProductListViewController({super.key});

  @override
  State<ProductListViewController> createState() =>
      _ProductListViewControllerState();
}

class _ProductListViewControllerState extends State<ProductListViewController> {
  final List<String> filters = const ["All", "Adidas", "Nike", "Bata"];
  late String selectedFilters;

  @override
  void initState() {
    super.initState();
    selectedFilters = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    //one way of resposiveness of app with mediaquery
    // final size = MediaQuery.sizeOf(context);

    const border = OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(225, 225, 225, 1),
        ),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));
    return SafeArea(
      child: Column(children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Shoes\nCollection",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilters = filter;
                      });
                    },
                    child: Chip(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1)),
                      backgroundColor: selectedFilters == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      label: Text(filter),
                      labelStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }),
        ),
        //one way of resposiveness of app with mediaquery
        // Expanded(
        //   child: size.width > 650
        //       ? GridView.builder(
        //           itemCount: products.length,
        //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             childAspectRatio: 2,
        //           ),
        //           itemBuilder: (context, index) {
        //             final product = products[index];
        //             return GestureDetector(
        //               onTap: () {
        //                 Navigator.of(context)
        //                     .push(MaterialPageRoute(builder: (context) {
        //                   return ProductDetailsPage(
        //                     product: product,
        //                   );
        //                 }));
        //               },
        //               child: ProductCard(
        //                 title: product['title'] as String,
        //                 price: product['price'] as double,
        //                 image: product['imageUrl'] as String,
        //                 backgroundColor: index.isEven
        //                     ? const Color.fromRGBO(216, 240, 253, 1)
        //                     : const Color.fromRGBO(245, 247, 249, 1),
        //               ),
        //             );
        //           })
        // : ListView.builder(
        //     itemCount: products.length,
        //     itemBuilder: (context, index) {
        //       final product = products[index];
        //       return GestureDetector(
        //         onTap: () {
        //           Navigator.of(context)
        //               .push(MaterialPageRoute(builder: (context) {
        //             return ProductDetailsPage(
        //               product: product,
        //             );
        //           }));
        //         },
        //         child: ProductCard(
        //           title: product['title'] as String,
        //           price: product['price'] as double,
        //           image: product['imageUrl'] as String,
        //           backgroundColor: index.isEven
        //               ? const Color.fromRGBO(216, 240, 253, 1)
        //               : const Color.fromRGBO(245, 247, 249, 1),
        //         ),
        //       );
        //     }),
        // ),

        //2nd way of resposive with layoutBuilder

        Expanded(
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 1080) {
              return GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.75,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProductDetailsPage(
                            product: product,
                          );
                        }));
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        image: product['imageUrl'] as String,
                        backgroundColor: index.isEven
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : const Color.fromRGBO(245, 247, 249, 1),
                      ),
                    );
                  });
            } else {
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProductDetailsPage(
                            product: product,
                          );
                        }));
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        image: product['imageUrl'] as String,
                        backgroundColor: index.isEven
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : const Color.fromRGBO(245, 247, 249, 1),
                      ),
                    );
                  });
            }
          }),
        )
      ]),
    );
  }
}

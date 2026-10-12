import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../widgets/product_card.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Filter products matching category[cite: 17]
    final filteredProducts = sampleProducts
        .where((p) => p.category.toLowerCase() == categoryName.toLowerCase())
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: filteredProducts.isEmpty
          ? const Center(child: Text("No products found."))
          : GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(product: filteredProducts[index]);
        },
      ),
    );
  }
}
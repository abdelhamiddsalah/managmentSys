import 'package:flutter/material.dart';
import 'package:managerestaurent/features/home/models/product.dart';
import 'package:managerestaurent/features/home/ui/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.product});
final Product product;
  @override
  Widget build(BuildContext context) {
    return DetailsViewBody(product: product);
  }
}
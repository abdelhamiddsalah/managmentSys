import 'package:flutter/material.dart';
import 'package:managerestaurent/features/home/ui/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.product});
final Map<String, dynamic> product;
  @override
  Widget build(BuildContext context) {
    return DetailsViewBody(product: product);
  }
}
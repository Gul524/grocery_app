import 'package:flutter/material.dart';
import 'package:grocery_app/configs/colors.dart';

class CartButton extends StatelessWidget {
  final VoidCallback onTap;
  const CartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Icon(
            Icons.shopping_cart_checkout,
            color: AppColors.primaryColorDark,
          ),
        ),
      ),
    );
  }
}

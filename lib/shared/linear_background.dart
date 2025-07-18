import 'package:flutter/material.dart';

class LinearBackground extends StatelessWidget {
  final Widget child;
  const LinearBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          colors: [
            Theme.of(context).splashColor,
            Theme.of(context).primaryColorLight,
          ],
        ),
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grocery_app/pages/home/home_app_bar.dart';
import 'package:grocery_app/pages/home/home_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: HomeAppBar(),
      ),
      body: Column(
        children: [
          HomeHeaderWidget(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 80,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow.shade200,
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.shopping_cart_checkout),
          ),
        ],
      ),
    );
  }
}

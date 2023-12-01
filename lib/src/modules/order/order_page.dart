import 'package:flutter/material.dart';

import 'widgets/order_header.dart';
import 'widgets/order_item.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Container(
          color: Colors.grey[50],
          padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
          child: Column(
            children: [
              const OrderHeader(),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 91,
                    // mainAxisSpacing: 20,
                    // crossAxisSpacing: 10,
                    maxCrossAxisExtent: 600,
                  ),
                  itemBuilder: (context, index) {
                    return OrderItem();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
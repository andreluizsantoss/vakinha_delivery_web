import 'package:flutter/material.dart';

import '../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../dto/order/order_product_dto.dart';

class OrderProductItem extends StatelessWidget {
  final OrderProductDto orderProduct;
  const OrderProductItem({
    Key? key,
    required this.orderProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              orderProduct.product.name,
              style: context.textStyles.textRegular,
            ),
          ),
          Text(
            '${orderProduct.amount}',
            style: context.textStyles.textRegular,
          ),
          Expanded(
            child: Text(
              orderProduct.totalPrice.currencyPTBR,
              style: context.textStyles.textRegular,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

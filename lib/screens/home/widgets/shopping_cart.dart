import 'package:flutter/material.dart';
import 'package:untitled/constants/asset_paths.dart';
import 'package:untitled/models/cart_item.dart';
import 'package:untitled/screens/home/widgets/cart_item_widget.dart';
import 'package:untitled/widgets/custom_btn.dart';
import 'package:untitled/widgets/custom_text.dart';
import 'package:untitled/Componentes/Pantallas/principal.dart';
import 'package:untitled/Componentes/Pantallas/Forma-Entrega/entregaprincipal.dart';

class ShoppingCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomText(
                text: "Carrito de compras",
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: <CartItemModel>[
                CartItemModel(
                    name: "Intestinomicina",
                    image: image1,
                    cost: "0.25",
                    quantity: "1"),
                CartItemModel(
                    name: "Acetaminofen",
                    image: image2,
                    cost: "1.50",
                    quantity: "1"),
                CartItemModel(
                    name: "Aleve Max",
                    image: image3,
                    cost: "1.00",
                    quantity: "1"),
                CartItemModel(
                    name: "Tabcin", image: image4, cost: "1.50", quantity: "1"),
              ]
                  .map((cartItem) => CartItemWidget(
                        cartItem: cartItem,
                      ))
                  .toList(),
            ),
          ],
        ),
        Positioned(
            bottom: 30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8),
              child: CustomButton(
                  text: "Pagar (\$${4.25})",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VistaEntrega()),
                    );
                  }),
            ))
      ],
    );
  }
}

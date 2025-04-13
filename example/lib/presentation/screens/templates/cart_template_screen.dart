import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartTemplateScreen extends StatefulWidget {
  const CartTemplateScreen({super.key});

  @override
  State<CartTemplateScreen> createState() => _CartTemplateScreenState();
}

class _CartTemplateScreenState extends State<CartTemplateScreen> {
  bool authentication = false;
  void _handleAuthentication() {
    setState(() {
      authentication = !authentication;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          authentication
              ? CustomAppbars(
                appbarType: AppbarType.cartAppbarlogout,
                backonPressed: () {},
                logOutonPressed: () {
                  _handleAuthentication();
                },
                name: 'Pepito',
                lastName: 'Perez',
              )
              : CustomAppbars(
                appbarType: AppbarType.cartAppbarlogin,
                backonPressed: () {},
                logInonPressed: () {
                  _handleAuthentication();
                },
              ),
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListView.separated(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ProductCartContainer(
                  url:
                      'https://ih1.redbubble.net/image.4905811472.8675/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
                  productName: 'productName',
                  amount: 'x1',
                  productPrice: '1200',
                  onPressedminus: () {},
                  onPressedplus: () {},
                );
              },
              separatorBuilder:
                  (context, index) => SizedBox(height: AppSpacing.small),
            ),
            Positioned(
              bottom: AppSpacing.small,
              left: 0,
              right: 0,
              child: Center(
                child:
                    authentication
                        ? CustomDialog(
                          dialogType: DialogType.authenticated,
                          onDialogButtonPressed: () {},
                        )
                        : CustomDialog(
                          dialogType: DialogType.unauthenticated,
                          onDialogButtonPressed: () {
                            _handleAuthentication();
                            context.pop();
                          },
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

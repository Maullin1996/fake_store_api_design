import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserTemplateScreen extends StatelessWidget {
  const UserTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UserTemplate(
      backonPressed: () {
        context.pop();
      },
      cartonPressed: () {},
      logOutonPressed: () {},
      lastName: 'Perez',
      name: 'Pepito',
      username: 'username',
      email: 'email',
      phone: 'phone',
      city: 'city',
      street: 'street',
      number: 'number',
      zipcode: 'zipcode',
    );
  }
}

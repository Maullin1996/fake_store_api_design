import 'package:example/config/mock/user_mock.dart';
import 'package:fake_store_design/template/user_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserPageScreen extends ConsumerWidget {
  const UserPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UserTemplate(
      backonPressed: () {
        context.pop();
      },
      cartonPressed: () {
        context.push('/cart_page');
      },
      logOutonPressed: () {},
      lastName: userMock.name.lastname,
      name: userMock.name.firstname,
      username: userMock.username,
      email: userMock.email,
      phone: userMock.phone,
      city: userMock.address.city,
      street: userMock.address.street,
      number: userMock.address.number.toString(),
      zipcode: userMock.address.zipcode,
    );
  }
}

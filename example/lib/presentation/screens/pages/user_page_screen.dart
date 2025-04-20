import 'package:example/presentation/providers/api_response/authentication_provider.dart';
import 'package:example/presentation/providers/api_response/user_provider.dart';
import 'package:fake_store_design/template/user_tamplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserPageScreen extends ConsumerWidget {
  const UserPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(userInfoProvider);
    final userInfo = userProvider.user;

    if (userProvider.isLoading || userInfo == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return UserTemplate(
      backonPressed: () {
        context.pop();
      },
      cartonPressed: () {
        context.push('/cart_page');
      },
      logOutonPressed: () {
        ref.read(authenticationProvider.notifier).logOutUser();
        context.go('/home_page');
      },
      lastName: userInfo.name.lastname,
      name: userInfo.name.firstname,
      username: userInfo.username,
      email: userInfo.email,
      phone: userInfo.phone,
      city: userInfo.address.city,
      street: userInfo.address.street,
      number: userInfo.address.number.toString(),
      zipcode: userInfo.address.zipcode,
    );
  }
}

import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Customs Appbars',
          style: textTheme.displayMedium?.copyWith(
            color: AppColors.onPrimary,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.onPrimary,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.onPrimary),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Login Home', style: textTheme.displayMedium),
            CustomAppbars(
              appbarType: AppbarType.homeLogInAppbar,
              logInonPressed: () {},
              cartonPressed: () {},
            ),
            SizedBox(height: AppSpacing.medium),

            Text('Logout Home', style: textTheme.displayMedium),
            CustomAppbars(
              appbarType: AppbarType.homeLogOutAppbar,
              useronPressed: () {},
              logOutonPressed: () {},
              cartonPressed: () {},
              name: 'Pepito',
              lastName: 'Perez',
            ),
            SizedBox(height: AppSpacing.medium),

            Text('Log In Cart', style: textTheme.displayMedium),
            CustomAppbars(
              appbarType: AppbarType.cartAppbarlogin,
              backonPressed: () {},
              logInonPressed: () {},
            ),
            SizedBox(height: AppSpacing.medium),

            Text('Log out Cart', style: textTheme.displayMedium),
            CustomAppbars(
              appbarType: AppbarType.cartAppbarlogout,
              backonPressed: () {},
              logOutonPressed: () {},
              name: 'Pepito',
              lastName: 'Perez',
            ),
            SizedBox(height: AppSpacing.medium),

            Text('Log In', style: textTheme.displayMedium),
            CustomAppbars(
              appbarType: AppbarType.logInAppbar,
              backonPressed: () {},
              cartonPressed: () {},
            ),
            SizedBox(height: AppSpacing.medium),

            Text('Log out Cart', style: textTheme.displayMedium),
            CustomAppbars(
              appbarType: AppbarType.productAppbar,
              backonPressed: () {},
              cartonPressed: () {},
            ),
            SizedBox(height: AppSpacing.medium),

            Text('User', style: textTheme.displayMedium),
            CustomAppbars(
              appbarType: AppbarType.userAppbar,
              backonPressed: () {},
              cartonPressed: () {},
              logOutonPressed: () {},
              name: 'Pepito',
              lastName: 'Perez',
            ),
            SizedBox(height: AppSpacing.medium),
          ],
        ),
      ),
    );
  }
}

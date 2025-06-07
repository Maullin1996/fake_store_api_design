import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/molecules/company_info/company_info.dart';
import 'package:flutter/material.dart';

class CompanyInformation extends StatelessWidget {
  const CompanyInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Company information',
        colorType: ColorType.primary,
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CompanyInfo(
            // address: '44522',
            // email: 'pepito@gmail.com',
            // whatsapp: '32233541214',
            // instagram: 'all.storehouse',
          ),
        ],
      ),
    );
  }
}

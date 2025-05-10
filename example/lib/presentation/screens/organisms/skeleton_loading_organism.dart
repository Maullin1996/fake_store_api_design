import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';

class SkeletonLoadingOrganism extends StatelessWidget {
  const SkeletonLoadingOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Skeleton Loading',
        colorType: ColorType.primary,
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: SkeletonLoadingContainer(width: width),
    );
  }
}

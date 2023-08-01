import 'package:flutter/material.dart';

import '../../core/ui/widgets/app_bar_custom.dart';
import '../../core/ui/widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent.buildAppBar(context, 1),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/blackBackground.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Footer(),
          )
        ],
      ),
    );
  }
}

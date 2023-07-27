import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobicar',
      debugShowCheckedModeBanner: false,
      routes: routes as Map<String, WidgetBuilder>,
    );
  }
}

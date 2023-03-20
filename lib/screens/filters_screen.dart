import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your FIlters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('FIlters'),
      ),
    );
  }
}

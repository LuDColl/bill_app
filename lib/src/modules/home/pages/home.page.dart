import 'package:bill_app/src/modules/home/widgets/app_bar.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 16 / 9,
        children: const [
          Card(child: Center(child: Text('Extrato'))),
          Card(child: Center(child: Text('Extrato'))),
          Card(child: Center(child: Text('Extrato'))),
        ],
      ),
    );
  }
}

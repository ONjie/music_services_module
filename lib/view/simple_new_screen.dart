import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimpleNewScreen extends StatelessWidget {
  const SimpleNewScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        surfaceTintColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: Icon(Icons.arrow_back, color: Colors.white,),
        ),
        title: Text(
          'Simple New Screen',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Center(
            child: Text(
              'You tapped on: $title',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}

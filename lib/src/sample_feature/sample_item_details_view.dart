import 'package:bebop/src/sample_feature/sample_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Displays detailed information about a SampleItem.
/// Displays SampleItem id in the center of the screen.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key, required this.id});

  static const routeName = '/sample_item';
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('More Information bear'),
            // display id in the center of the screen
            Text('id: $id'),

            ElevatedButton(
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                context.go('/');
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}

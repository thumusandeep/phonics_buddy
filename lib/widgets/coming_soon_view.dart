// lib/widgets/coming_soon_inline.dart
import 'package:flutter/material.dart';

class ComingSoonInline extends StatelessWidget {
  final String blendName;

  const ComingSoonInline({super.key, required this.blendName});

  @override
  Widget build(BuildContext context) {
    debugPrint("$blendName, is coming soon...!");
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue.withOpacity(0.1)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Takes only as much space as needed
          children: [
            const Icon(Icons.auto_awesome, size: 60, color: Colors.orangeAccent),
            const SizedBox(height: 20),
            Text(
              "The '$blendName' Family",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const Text(
              "is being prepared for you!",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            // const CircularProgressIndicator(strokeWidth: 2), // Small detail to show "working"
          ],
        ),
      ),
    );
  }
}
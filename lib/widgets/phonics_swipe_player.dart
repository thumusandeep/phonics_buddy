import 'package:flutter/material.dart';
import '../utils/phonics_utils.dart';

class PhonicsSwipePlayer extends StatefulWidget {
  final Widget child;
  final PageController controller;
  final List<String> items;
  final Function(int) onPageChanged;
  final String Function(String item) pathBuilder;

  const PhonicsSwipePlayer({
    Key? key,
    required this.child,
    required this.controller,
    required this.items,
    required this.onPageChanged,
    required this.pathBuilder,
  }) : super(key: key);

  @override
  State<PhonicsSwipePlayer> createState() => _PhonicsSwipePlayerState();
}

class _PhonicsSwipePlayerState extends State<PhonicsSwipePlayer> {
  int _currentIndex = 0;

  void _triggerAudio(int index) {
    if (index < 0 || index >= widget.items.length) return;
    
    // Build the dynamic path based on the current active item
    final activeItem = widget.items[index];
    final fullAudioPath = widget.pathBuilder(activeItem);
    
    // Fire the global audio engine
    PhonicsUtils.playAudio(fullAudioPath);
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        // Automatically plays audio ONLY when the user finishes sliding the page
        if (notification is ScrollEndNotification) {
          final roundedPage = widget.controller.page?.round() ?? 0;
          if (roundedPage != _currentIndex) {
            _currentIndex = roundedPage;
            widget.onPageChanged(_currentIndex);
            _triggerAudio(_currentIndex);
          }
        }
        return false;
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // Replays audio instantly when tapping anywhere on the current page
          debugPrint("GLOBAL SWIPE WRAPPER: Replaying page $_currentIndex");
          _triggerAudio(_currentIndex);
        },
        child: widget.child,
      ),
    );
  }
}
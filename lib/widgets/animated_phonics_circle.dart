import 'package:flutter/material.dart';

class AnimatedPhonicsCircle extends StatefulWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const AnimatedPhonicsCircle({
    required this.text, 
    required this.color, 
    required this.onTap
  });

  @override
  _AnimatedPhonicsCircleState createState() => _AnimatedPhonicsCircleState();
}

class _AnimatedPhonicsCircleState extends State<AnimatedPhonicsCircle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100), // Quick pop
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward().then((_) => _controller.reverse()); // Grow then shrink
    widget.onTap(); // Play the sound
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: widget.color.withOpacity(0.7),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(0.3),
                blurRadius: 15,
                spreadRadius: 5,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 54, 
              fontWeight: FontWeight.bold, 
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
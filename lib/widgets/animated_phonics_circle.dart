import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 


class AnimatedPhonicsCircle extends StatefulWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const AnimatedPhonicsCircle({
    required this.text, 
    required this.color, 
    required this.onTap,
    Key? key, 
  }) : super(key: key);

  @override
  _AnimatedPhonicsCircleState createState() => _AnimatedPhonicsCircleState();
}

class _AnimatedPhonicsCircleState extends State<AnimatedPhonicsCircle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isFlashing = false; // For the "Rainbow Pulse"

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

  void _handleTap() async {
    // 1. THE VIBRATION (Added here)
    // We use .vibrate() because it's the most reliable for Web browsers
    await HapticFeedback.vibrate(); 

    // 2. THE VISUAL PULSE (Turn on the flash)
    setState(() => _isFlashing = true);

    // 3. THE ANIMATION (Pop the circle)
    _controller.forward().then((_) {
      _controller.reverse();
      // Turn off the flash once the animation finishes
      setState(() => _isFlashing = false); 
    });

    widget.onTap(); // Play the sound
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            // If flashing, make it bright white/yellow, otherwise use the normal color
            color: _isFlashing ? Colors.white : widget.color.withOpacity(0.7),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                // Make the glow bigger during the tap
                color: _isFlashing ? Colors.white : widget.color.withOpacity(0.3),
                blurRadius: _isFlashing ? 30 : 15,
                spreadRadius: _isFlashing ? 10 : 5,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 54, 
              fontWeight: FontWeight.bold, 
              // Change text color during flash so it's still readable
              color: _isFlashing ? widget.color : Colors.white 
            ),
          ),
        ),
      ),
    );
  }
}
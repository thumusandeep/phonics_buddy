import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class LessonView extends StatefulWidget {
  final String prefix;
  final String blend;
  final String fullWord;

  const LessonView({
    super.key,
    required this.prefix,
    required this.blend,
    required this.fullWord,
  });


  @override
  State<LessonView> createState() => _LessonViewState(); // Returning the public 'State' type
}

class _LessonViewState extends State<LessonView> {
  final AudioPlayer _player = AudioPlayer();
  // Track if the full word has been tapped to show the star
  bool _showStar = false;

  void _playSound(String category, String fileName) async {
    // 1. Trigger Vibration immediately
    HapticFeedback.mediumImpact();

    // 2. Play Sound
    String path = "audio/$category/${fileName.toLowerCase()}.mp3";
    try {
      await _player.stop();
      await _player.play(AssetSource(path));
    } catch (e) {
      debugPrint("Error playing sound: $path");
    }

    // 3. Logic for the Success Star
    // If the category is 'words', it means she finished the blend!
    if (category == 'words' || category.contains('words/cvc')) {
      setState(() {
        _showStar = true;
      });

      // Hide the star after 3 seconds so she can keep playing
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) setState(() => _showStar = false);
      });
    }  
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Short 'a' Blends - [æ] - ${widget.blend.toUpperCase()}",
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  _buildPhonicsCircle(widget.prefix, Colors.blue, 
                      () => _playSound('consonants', widget.prefix)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("+", style: TextStyle(fontSize: 60)),
                  ),
                  // 2. The Blend
                  _buildPhonicsCircle(widget.blend, Colors.blue, 
                      () => _playSound('blends', widget.blend)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("=", style: TextStyle(fontSize: 60)),
                  ),
                  // 3. The Full Word
                  _buildPhonicsCircle(widget.fullWord, Colors.orange, 
                      () => _playSound('words/cvc/at_family', widget.fullWord)),
                ],
              ),
            ],
          ),
        ),
        // --- THE SUCCESS STAR ---
        if (_showStar)
          IgnorePointer(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 500),
              builder: (context, double value, child) {
                return Transform.scale(
                  scale: value * 1.5, // Make it pop and grow
                  child: Opacity(
                    opacity: value,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.stars, color: Colors.amber, size: 180),
                        const SizedBox(height: 10),
                        Text("GREAT JOB!", 
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.orange)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildPhonicsCircle(String text, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300), 
        // Optional: Add a curve to make it feel more "natural"
        curve: Curves.easeInOut, 
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: color.withOpacity(0.6),
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontSize: 54, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  // void _playPhonicsSound({required String category, required String fileName}) async {
  //   // categories: 'consonants', 'vowels/short', 'vowels/long', 'blends', 'words'
  //   String path = "audio/$category/${fileName.toLowerCase()}.mp3";
    
  //   try {
  //     await _player.play(AssetSource(path));
  //   } catch (e) {
  //     print("Error playing sound: $path - Make sure the file exists!");
  //   }
  // }

}
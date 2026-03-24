import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class LessonView extends StatefulWidget {
  final String prefix;
  final String blend;
  final String fullWord;

  const LessonView({
    required this.prefix,
    required this.blend,
    required this.fullWord,
  });

  @override
  _LessonViewState createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {
  final AudioPlayer _player = AudioPlayer();

  void _playSound(String type, String fileName) async {
    // This assumes your files are named 'b.mp3', 'ad.mp3', etc.
    String path = "audio/$type/${fileName.toLowerCase()}.mp3";
    await _player.play(AssetSource(path));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Short 'a' Blends - [æ] - ${widget.blend}",
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. The Prefix (Phoneme)
              _buildPhonicsCircle(widget.prefix, Colors.blue, () => _playSound('consonants', widget.prefix)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("+", style: TextStyle(fontSize: 60)),
              ),
              // 2. The Blend
              _buildPhonicsCircle(widget.blend, Colors.blue, () => _playSound('blends', widget.blend)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("=", style: TextStyle(fontSize: 60)),
              ),
              // 3. The Full Word
              _buildPhonicsCircle(widget.fullWord, Colors.orange, () => _playSound('words', widget.fullWord)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPhonicsCircle(String text, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: color.withOpacity(0.6),
          shape: BoxShape.circle,
          boxShadow: [
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

  void _playPhonicsSound({required String category, required String fileName}) async {
    // categories: 'consonants', 'vowels/short', 'vowels/long', 'blends', 'words'
    String path = "audio/$category/${fileName.toLowerCase()}.mp3";
    
    try {
      await _player.play(AssetSource(path));
    } catch (e) {
      print("Error playing sound: $path - Make sure the file exists!");
    }
  }
}
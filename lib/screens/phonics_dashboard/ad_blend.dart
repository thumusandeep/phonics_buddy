// lib/screens/phonics_dashboard/ad_blend.dart


import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../data/phonics_content/ad_data.dart'; // Import your list of 7 words
import '../../widgets/animated_phonics_circle.dart';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AdBlendScreen extends StatefulWidget {
  @override
  _AdBlendScreenState createState() => _AdBlendScreenState();
}

class _AdBlendScreenState extends State<AdBlendScreen> {
  
  final AudioPlayer _player = AudioPlayer();
  final PageController _pageController = PageController();

  void _play(String folder, String fileName) async {
    double volume = 1.0; // Default volume (100%)

    // Boost consonants because they are usually shorter and quieter
    if (folder == 'consonant') {
      volume = 1.0; 
    } else if (folder == 'word') {
      volume = 0.7; // Slightly lower the full words if they are too loud
    }


    String path = "audio/$folder/${fileName.toLowerCase()}.mp3";

    if (folder == 'consonant') path = "audio/consonants/${fileName.toLowerCase()}.mp3";
    if (folder == 'blend') path = "audio/blends/${fileName.toLowerCase()}.mp3";
    if (folder == 'word') path = "audio/words/cvc/3_letters/ad_blend_words/${fileName.toLowerCase()}.mp3";

    try {
      await _player.stop();
      await Future.delayed(const Duration(milliseconds: 150));
      await _player.setVolume(volume);
      await _player.setSource(AssetSource(path));
      await _player.resume(); 
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    
    // Wait 1 second after the page opens, then "nudge" it
    Future.delayed(const Duration(seconds: 1), () {
      if (_pageController.hasClients) {
        _pageController.animateTo(
          40.0, // Nudge 40 pixels
          duration: const Duration(milliseconds: 400), 
          curve: Curves.easeOut
        ).then((_) => _pageController.animateTo(0, 
          duration: const Duration(milliseconds: 400), 
          curve: Curves.easeIn));
      }
    });
  }

  @override
  void dispose() {
    // Always remove the listener or dispose the controller to save memory
    _pageController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse, // This is the magic for your laptop
            PointerDeviceKind.trackpad,
          },
        ),
        // 'alignment: Alignment.center' centers the PageView automatically
        
        child: Stack(
          alignment: Alignment.center, 
          // 1. THE MAIN CONTENT (Keep this exactly as you have it)
          children: [
            PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              itemCount: adFamilyWords.length,
              itemBuilder: (context, index) {
                return _buildLessonPage(adFamilyWords[index]);
              },
            ),
          
            // 2. THE DOTS (Wrapped in Positioned to force them to the bottom)
            Positioned(
              bottom: 40, // This pushes the dots 40 pixels up from the bottom edge
              child: SmoothPageIndicator(
                controller: _pageController,
                count: adFamilyWords.length,
                effect: ScrollingDotsEffect(
                  activeDotColor: Colors.orange,
                  dotColor: Colors.blue.withOpacity(0.2),
                  dotHeight: 12,
                  dotWidth: 12,
                  // This creates the "3-dot window" look you described
                  maxVisibleDots: 5, 
                  fixedCenter: true, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for a clean, kid-friendly button
  Widget _navigationButton({required IconData icon, required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        iconSize: 50,
        icon: Icon(icon, color: Colors.blue.shade300),
        onPressed: onPressed,
      ),
    );
  }
  Widget _buildLessonPage(PhonicsWord item) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FittedBox(
          fit: BoxFit.contain, // This is the magic line
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedPhonicsCircle(
                text: item.onset,
                color: Colors.blue,
                onTap: () => _play('consonant', item.onset),
              ),
              _operator("+"),
              AnimatedPhonicsCircle(
                text: item.rime,
                color: Colors.blue,
                onTap: () => _play('blend', item.rime),
              ),
              _operator("="),
              AnimatedPhonicsCircle(
                text: item.fullWord,
                color: Colors.orange,
                onTap: () => _play('word', item.fullWord),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _operator(String symbol) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(symbol, style: TextStyle(fontSize: 60, fontWeight: FontWeight.w300)),
    );
  }
}
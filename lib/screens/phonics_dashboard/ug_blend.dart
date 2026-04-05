// lib/screens/phonics_dashboard/ug_blend.dart

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../data/phonics_content/ug_data.dart';
import '../../widgets/animated_phonics_circle.dart';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UgBlendScreen extends StatefulWidget {
  @override
  _UgBlendScreenState createState() => _UgBlendScreenState();
}

class _UgBlendScreenState extends State<UgBlendScreen> {
  
  final AudioPlayer _player = AudioPlayer();
  final PageController _pageController = PageController();

  void _play(String folder, String fileName) async {
    double volume = 1.0;

    if (folder == 'word') {
      volume = 0.7; 
    }

    String path = "audio/$folder/${fileName.toLowerCase()}.mp3";

    if (folder == 'consonant') path = "audio/consonants/${fileName.toLowerCase()}.mp3";
    if (folder == 'blend') path = "audio/blends/${fileName.toLowerCase()}.mp3";
    if (folder == 'word') path = "audio/words/cvc/3_letters/ug_blend_words/${fileName.toLowerCase()}.mp3";

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
    Future.delayed(const Duration(seconds: 1), () {
      if (_pageController.hasClients) {
        _pageController.animateTo(40.0, duration: const Duration(milliseconds: 400), curve: Curves.easeOut)
          .then((_) => _pageController.animateTo(0, duration: const Duration(milliseconds: 400), curve: Curves.easeIn));
      }
    });
  }

  @override
  void dispose() {
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
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
          },
        ),
        child: Stack(
          alignment: Alignment.center, 
          children: [
            PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              itemCount: ugFamilyWords.length,
              itemBuilder: (context, index) {
                return _buildLessonPage(ugFamilyWords[index]);
              },
            ),
            Positioned(
              bottom: 40,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: ugFamilyWords.length,
                effect: ScrollingDotsEffect(
                  activeDotColor: Colors.orange,
                  dotColor: Colors.blue.withOpacity(0.2),
                  dotHeight: 12,
                  dotWidth: 12,
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

  Widget _buildLessonPage(PhonicsWord item) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FittedBox(
          fit: BoxFit.contain,
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

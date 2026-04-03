import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../widgets/animated_phonics_circle.dart';
import 'dart:ui';

enum VowelMode { short, long }

class VowelsView extends StatefulWidget {
  @override
  _VowelsViewState createState() => _VowelsViewState();
}

class _VowelsViewState extends State<VowelsView> {
  VowelMode _currentMode = VowelMode.short; // Default to Short Vowels
  int _currentIndex = 0;
  final List<String> vowels = ['A', 'E', 'I', 'O', 'U'];
  final PageController _pageController = PageController();
  final AudioPlayer _player = AudioPlayer();

  void _play(String letter) async {
    // Dynamically choose the folder based on the mode
    String folder = (_currentMode == VowelMode.short) ? "short" : "long";
    String fileName = "${letter.toLowerCase()}.mp3";
    String path = "audio/vowels/$folder/$fileName";

    print("DEBUG: Trying to play path: $path");
    
    try {
      await _player.stop();
      // Use DeviceFileSource or generic Source if AssetSource fails on Chrome
      await _player.play(AssetSource(path.replaceFirst('assets/', ''))); 
      // If that still fails, try:
      // await _player.setSource(AssetSource(path.replaceFirst('assets/', '')));
    } catch (e) {
      debugPrint("Audio Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Color themeColor = (_currentMode == VowelMode.short) ? Colors.green : Colors.orangeAccent;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse, // This is what your Lenovo needs
          PointerDeviceKind.trackpad,
        },
      ),
      child: Column(
        children: [
          // 1. THE MODE SWITCHER
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SegmentedButton<VowelMode>(
              segments: const [
                ButtonSegment(value: VowelMode.short, label: Text('Short Vowels'), icon: Icon(Icons.apple)),
                ButtonSegment(value: VowelMode.long, label: Text('Long Vowels'), icon: Icon(Icons.cake)),
              ],
              selected: {_currentMode},
              onSelectionChanged: (newSelection) {
                setState(() {
                  _currentMode = newSelection.first;
                });
                _play(vowels[_currentIndex]); // Re-play the sound in the new mode
              },
            ),
          ),

          // 2. THE SELECTOR GRID (Top)
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(vowels.length, (index) {
                bool isSelected = _currentIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ChoiceChip(
                    label: Text(vowels[index], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    selected: isSelected,
                    selectedColor: themeColor,
                    onSelected: (selected) {
                      if (selected) {
                        _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
                      }
                    },
                  ),
                );
              }),
            ),
          ),

          // 3. THE FOCUS AREA (Bottom)
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                    _play(vowels[index]);
                  },
                  itemCount: vowels.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: AnimatedPhonicsCircle(
                        text: vowels[index],
                        color: themeColor,
                        onTap: () => _play(vowels[index]),
                      ),
                    );
                  },
                ),
                
              ],
            ),
          ),
        ],
      )
    );
  }

  // ... (Same _navArrow helper as before, just pass 'color' to it)
  Widget _navArrow(IconData icon, {required bool isLeft, required Color color}) {
    return Positioned(
      left: isLeft ? 40 : null,
      right: isLeft ? null : 40,
      // Positioning it slightly higher for better ergonomics
      top: MediaQuery.of(context).size.height / 3.5, 
      child: IconButton(
        icon: Icon(icon, size: 50, color: color.withOpacity(0.5)),
        onPressed: () {
          if (isLeft && _currentIndex > 0) {
            _onLetterSelected(_currentIndex - 1);
          } else if (!isLeft && _currentIndex < vowels.length - 1) {
            _onLetterSelected(_currentIndex + 1);
          }
        },
      ),
    );
  }

  void _onLetterSelected(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut
    );
    _play(vowels[index]);
  }
  
}
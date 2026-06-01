import 'package:phonics_buddy/utils/phonics_utils.dart'; 
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../widgets/animated_phonics_circle.dart';
import 'dart:ui';
import 'dart:async'; // Required for Timer balancing

enum VowelMode { short, long }

class VowelsView extends StatefulWidget {
  @override
  _VowelsViewState createState() => _VowelsViewState();
}

class _VowelsViewState extends State<VowelsView> {
  VowelMode _currentMode = VowelMode.short; 
  int _currentIndex = 0;
  final List<String> vowels = ['A', 'E', 'I', 'O', 'U'];
  final PageController _pageController = PageController();
  
  // ⏱️ Adds a micro debounce timer to clear physical swipe gestures for Apple WebKit
  Timer? _swipeDebounce;

  void _play(String letter) {
    String folder = (_currentMode == VowelMode.short) ? "short" : "long";
    String fileName = "${letter.toLowerCase()}.mp3";
    
    PhonicsUtils.playAudio("audio/vowels/$folder/$fileName");
  }

  // 🔊 Clean logic for both Swipes and Arrow/Chip selections
  void _handlePageChange(int index) {
    setState(() => _currentIndex = index);
    
    // Cancel any quick active transitions to protect the hardware buffer
    _swipeDebounce?.cancel();
    
    // 150ms buffer tells iOS Safari: "Finger lift completed, treat audio as intentional user interaction"
    _swipeDebounce = Timer(const Duration(milliseconds: 150), () {
      if (mounted) {
        _play(vowels[index]);
      }
    });
  }

  @override
  void dispose() {
    _swipeDebounce?.cancel(); // Memory cleanup
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color themeColor = (_currentMode == VowelMode.short) ? Colors.green : Colors.orangeAccent;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse, 
          PointerDeviceKind.trackpad,
        },
      ),
      child: Column(
        children: [
          // 1. THE MODE SWITCHER
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SegmentedButton<VowelMode>(
              showSelectedIcon: false,
              segments: const [
                ButtonSegment(value: VowelMode.short, label: Text('Short Vowels'), icon: Icon(Icons.apple)),
                ButtonSegment(value: VowelMode.long, label: Text('Long Vowels'), icon: Icon(Icons.cake)),
              ],
              selected: {_currentMode},
              onSelectionChanged: (newSelection) {
                setState(() {
                  _currentMode = newSelection.first;
                });
                _play(vowels[_currentIndex]); 
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
                    showCheckmark: false,
                    onSelected: (selected) {
                      if (selected) {
                        _onLetterSelected(index);
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
                // Tap tracking layer covering the entire screen canvas area
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    debugPrint("CANVAS TAP: Replaying active vowel sound");
                    _play(vowels[_currentIndex]);
                  },
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _handlePageChange, // Routed to our custom interaction filter
                    itemCount: vowels.length,
                    itemBuilder: (context, index) {
                      String ipa = PhonicsUtils.getIPA(vowels[index], isLong: _currentMode == VowelMode.long);

                      return Column(
                        children: [
                          AnimatedPhonicsCircle(
                            text: vowels[index],
                            color: themeColor,
                            onTap: () => _play(vowels[index]),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: themeColor.withOpacity(0.1), 
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: themeColor.withOpacity(0.3)),
                            ),
                            child: Text(
                              ipa,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: themeColor.withOpacity(0.8), 
                                fontFamily: 'monospace', 
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                
                // Add the explicit Nav Arrows over the Stack layout
                _navArrow(Icons.arrow_back_ios, isLeft: true, color: themeColor),
                _navArrow(Icons.arrow_forward_ios, isLeft: false, color: themeColor),
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _navArrow(IconData icon, {required bool isLeft, required Color color}) {
    return Positioned(
      left: isLeft ? 40 : null,
      right: isLeft ? null : 40,
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
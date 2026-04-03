import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../widgets/animated_phonics_circle.dart';
import 'package:flutter/services.dart'; 
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:ui';


class ConsonantsView extends StatefulWidget {
  @override
  _ConsonantsViewState createState() => _ConsonantsViewState();
}

class _ConsonantsViewState extends State<ConsonantsView> {
  final AudioPlayer _player = AudioPlayer();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> consonants = [
    'B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 
    'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Y', 'Z'
  ];

  void _onLetterSelected(int index) {
    HapticFeedback.lightImpact();
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index, 
      duration: Duration(milliseconds: 300), 
      curve: Curves.easeInOut
    );
    _play(consonants[index]);
  }

  Future<void> _onCircleTap() async {
    // 1. Force the 'Thump' immediately
    await HapticFeedback.vibrate(); // 'vibrate' is the most reliable for Web
    
    // 2. Add a tiny delay (optional) if the sound cuts off the vibration
    // 3. Play the sound
    _play(consonants[_currentIndex]);
  }

  void _play(String letter) async {
    await _player.stop();
    await _player.play(AssetSource("audio/consonants/${letter.toLowerCase()}.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse, // This is what your Lenovo needs
            PointerDeviceKind.trackpad,
          },
        ),
        child: Column(
          children: [
            // 1. TOP SECTION: Selector Grid
            Padding(
              padding: const EdgeInsets.all(15),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossCount = constraints.maxWidth < 600 ? 6 : 11;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossCount,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: consonants.length,
                    itemBuilder: (context, index) {
                      bool isSelected = _currentIndex == index;
                      return GestureDetector(
                        onTap: () => _onLetterSelected(index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 2),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            consonants[index],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.blue,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // 2. MAIN SECTION: The Focus Area
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(), 
                    onPageChanged: (index) {
                      setState(() => _currentIndex = index);
                      _play(consonants[index]);
                    },
                    itemCount: consonants.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: AnimatedPhonicsCircle(
                          text: consonants[index],
                          color: Colors.orange,
                          onTap: () => _play(consonants[index]),
                        ),
                      );
                    },
                  ),
                  // THE DOTS: Positioned at the bottom of the stack
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: consonants.length,
                      effect: ScrollingDotsEffect(
                        activeDotColor: Colors.orange,
                        dotColor: Colors.blue.withOpacity(0.2),
                        dotHeight: 12,
                        dotWidth: 12,
                        // This is the "Capsule" setting:
                        // It will show 3 main dots and shrink the ones at the edges
                        maxVisibleDots: 5, 
                        fixedCenter: true, // This keeps the active dot in the middle of the capsule
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _navArrow(IconData icon, {required bool isLeft, required Color color}) {
    return Positioned(
      left: isLeft ? 40 : null,
      right: isLeft ? null : 40,
      top: MediaQuery.of(context).size.height / 4,
      child: IconButton(
        icon: Icon(icon, size: 50, color: Colors.blue.withOpacity(0.5)),
        onPressed: () {
          if (isLeft && _currentIndex > 0) {
            _onLetterSelected(_currentIndex - 1);
          } else if (!isLeft && _currentIndex < consonants.length - 1) {
            _onLetterSelected(_currentIndex + 1);
          }
        },
      ),
    );
  }
}
Stack(
  alignment: Alignment.bottomCenter,
  children: [
    PageView.builder(
      controller: _pageController,
      // Use the correct list name: adFamilyWords
      itemCount: adFamilyWords.length, 
      itemBuilder: (context, index) {
        // Pass the specific word at the current index
        return _buildLessonPage(adFamilyWords[index]);
      },
    ),

    // THE VISUAL CUE: Page Dots
    Padding(
      padding: const EdgeInsets.only(bottom: 40.0), // Higher up so it doesn't touch the edge
      child: SmoothPageIndicator(
        controller: _pageController,
        count: adFamilyWords.length,
        // Removed 'const' because WormEffect uses dynamic colors
        effect: WormEffect( 
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: Colors.orange,
          dotColor: Colors.blue.withOpacity(0.2),
          type: WormType.thin,
        ),
      ),
    ),
  ],
)
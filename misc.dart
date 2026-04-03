PageView.builder(
  controller: _pageController,
  itemCount: atFamilyWords.length,
  itemBuilder: (context, index) {
    // Get the specific word object for this page
    final phonicsData = atFamilyWords[index];

    return LessonView(
      prefix: phonicsData.onset,    // Matches 'onset' in your class
      blend: phonicsData.rime,      // Matches 'rime' in your class
      fullWord: phonicsData.fullWord,
    );
  },
)
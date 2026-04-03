body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
          },
        ),
        // CHANGE THIS FROM Stack TO Column
        child: Column( 
          children: [
            // 1. TOP SECTION: Selector Grid
            Padding(
              padding: const EdgeInsets.all(15),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossCount = constraints.maxWidth < 600 ? 6 : 11;
                  return GridView.builder(
                    shrinkWrap: true, // This keeps the grid from taking infinite height
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossCount,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: consonants.length,
                    itemBuilder: (context, index) {
                      // ... (Your existing GestureDetector code remains exactly the same)
                    },
                  );
                },
              ),
            ),

            // This SizedBox is fine here inside a Column
            const SizedBox(height: 20),

            // 2. MAIN SECTION: Now 'Expanded' is valid because its parent is a Column!
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
                  // THE DOTS
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      // ... (Your existing SmoothPageIndicator code)
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
FilterChip(
  label: Text("U"),
  selected: _selectedVowel == "U",
  showCheckmark: false, // <--- ADD THIS LINE
  onSelected: (bool selected) {
    // your selection logic
  },
  // ... other styling
)
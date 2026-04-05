// lib/utils/phonics_utils.dart

class PhonicsUtils {
  static String getIPA(String text, {required bool isLong}) {
    final cleanText = text.toUpperCase().trim();

    // 1. Vowels (Short & Long)
    if (['A', 'E', 'I', 'O', 'U'].contains(cleanText)) {
      if (!isLong) {
        switch (cleanText) {
          case 'A': return '/æ/'; // Apple
          case 'E': return '/ɛ/ or /e/'; // Egg
          case 'I': return '/ɪ/'; // Igloo
          case 'O': return '/ɒ/'; // Octopus
          case 'U': return '/ʌ/'; // Umbrella
        }
      } else {
        switch (cleanText) {
          case 'A': return '/eɪ/'; // Cake
          case 'E': return '/iː/'; // Tree
          case 'I': return '/aɪ/'; // Kite
          case 'O': return '/oʊ/'; // Boat
          case 'U': return '/juː/'; // Cube
        }
      }
    }

    // 2. Digraphs (Two letters, one sound)
    switch (cleanText) {
      case 'CH': return '/tʃ/'; // Chip
      case 'SH': return '/ʃ/';  // Ship
      case 'TH': return '/θ/';  // Thin (unvoiced)
      case 'PH': return '/f/';  // Phone
      case 'WH': return '/w/';  // Wheel
      case 'NG': return '/ŋ/';  // Ring
    }

    // 3. Common Consonants (Standard sounds)
    switch (cleanText) {
      case 'B': return '/b/';
      case 'C': return '- /k/ (hard-before a, o, u) \n- /s/ (soft-before e, i, y)';
      case 'D': return '/d/';
      case 'F': return '/f/';
      case 'G': return '/ɡ/';
      case 'H': return '/h/';
      case 'J': return '/dʒ/';
      case 'K': return '/k/';
      case 'L': return '/l/';
      case 'M': return '/m/';
      case 'N': return '/n/';
      case 'P': return '/p/';
      case 'Q': return '/kw/';
      case 'R': return '/r/';
      case 'S': return '/s/';
      case 'T': return '/t/';
      case 'V': return '/v/';
      case 'W': return '/w/';
      case 'X': return '/ks/';
      case 'Y': return '/j/';
      case 'Z': return '/z/';
    }

    return ''; // Fallback
  }
}
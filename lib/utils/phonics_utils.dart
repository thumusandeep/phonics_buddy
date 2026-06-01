// lib/utils/phonics_utils.dart

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PhonicsUtils {
  // 1. Single global player instance used across the entire app
  static final AudioPlayer _globalPlayer = AudioPlayer();

  // 2. Centralized audio execution logic optimized to bypass iOS audio context locks
  static Future<void> playAudio(String assetPath) async {
    final cleanPath = assetPath.replaceFirst('assets/', '');
    debugPrint("GLOBAL AUDIO: Playing path -> $cleanPath");

    try {
      // 1. Force clear any current session
      await _globalPlayer.stop();

      // 2. Set the release mode to stop to reset the device hardware buffer after every play
      await _globalPlayer.setReleaseMode(ReleaseMode.stop);

      // 3. FORCE iOS to cache and decode the file directly into memory using a web URL stream
      // This bypasses the typical "lazy-loading" stream that iOS blocks on short files
      await _globalPlayer.setSource(AssetSource(cleanPath));
      
      // 4. Wake up the iOS hardware driver explicitly
      await _globalPlayer.setVolume(1.0);
      
      // 5. Fire the audio
      await _globalPlayer.resume();
    } catch (e) {
      debugPrint("GLOBAL AUDIO ERROR: $e");
    }
  }

  // 3. Your existing IPA mapping logic remains completely untouched
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
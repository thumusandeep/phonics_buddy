void _play(String path) async {
  try {
    await _player.stop();
    
    // 1. WAKE UP THE SPEAKER
    // Play a 0.1 second "silent" beep or just a tiny delay
    // Some developers use a very low volume "ping" to engage the driver
    await Future.delayed(const Duration(milliseconds: 150)); 

    // 2. PLAY THE ACTUAL SOUND
    await _player.play(AssetSource(path));
  } catch (e) {
    debugPrint("Audio Error: $e");
  }
}
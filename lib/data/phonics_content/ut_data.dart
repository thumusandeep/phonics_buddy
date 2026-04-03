// lib/data/phonics_content/ut_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> utFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ut', fullWord: 'but'),
  PhonicsWord(onset: 'c', rime: 'ut', fullWord: 'cut'),
  PhonicsWord(onset: 'g', rime: 'ut', fullWord: 'gut'),
  PhonicsWord(onset: 'h', rime: 'ut', fullWord: 'hut'),
  PhonicsWord(onset: 'j', rime: 'ut', fullWord: 'jut'),
  PhonicsWord(onset: 'n', rime: 'ut', fullWord: 'nut'),
  PhonicsWord(onset: 'r', rime: 'ut', fullWord: 'rut'),
];
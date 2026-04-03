// lib/data/phonics_content/ot_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> otFamilyWords = [
  PhonicsWord(onset: 'c', rime: 'ot', fullWord: 'cot'),
  PhonicsWord(onset: 'd', rime: 'ot', fullWord: 'dot'),
  PhonicsWord(onset: 'g', rime: 'ot', fullWord: 'got'),
  PhonicsWord(onset: 'h', rime: 'ot', fullWord: 'hot'),
  PhonicsWord(onset: 'j', rime: 'ot', fullWord: 'jot'),
  PhonicsWord(onset: 'l', rime: 'ot', fullWord: 'lot'),
  PhonicsWord(onset: 'n', rime: 'ot', fullWord: 'not'),
  PhonicsWord(onset: 'p', rime: 'ot', fullWord: 'pot'),
  PhonicsWord(onset: 'r', rime: 'ot', fullWord: 'rot'),
];
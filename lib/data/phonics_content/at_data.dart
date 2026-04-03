// lib/data/phonics_content/at_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> atFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'at', fullWord: 'bat'),
  PhonicsWord(onset: 'c', rime: 'at', fullWord: 'cat'),
  PhonicsWord(onset: 'f', rime: 'at', fullWord: 'fat'),
  PhonicsWord(onset: 'h', rime: 'at', fullWord: 'hat'),
  PhonicsWord(onset: 'm', rime: 'at', fullWord: 'mat'),
  PhonicsWord(onset: 'p', rime: 'at', fullWord: 'pat'),
  PhonicsWord(onset: 'r', rime: 'at', fullWord: 'rat'),
  PhonicsWord(onset: 's', rime: 'at', fullWord: 'sat'),
  PhonicsWord(onset: 'v', rime: 'at', fullWord: 'vat'),
];
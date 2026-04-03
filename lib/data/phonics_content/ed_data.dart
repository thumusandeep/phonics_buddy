// lib/data/phonics_content/ed_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> edFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ed', fullWord: 'bed'),
  PhonicsWord(onset: 'f', rime: 'ed', fullWord: 'fed'),
  PhonicsWord(onset: 'l', rime: 'ed', fullWord: 'led'),
  PhonicsWord(onset: 'r', rime: 'ed', fullWord: 'red'),
  PhonicsWord(onset: 'w', rime: 'ed', fullWord: 'wed'),
];
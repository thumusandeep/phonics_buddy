// lib/data/phonics_content/un_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> unFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'un', fullWord: 'bun'),
  PhonicsWord(onset: 'f', rime: 'un', fullWord: 'fun'),
  PhonicsWord(onset: 'g', rime: 'un', fullWord: 'gun'),
  PhonicsWord(onset: 'n', rime: 'un', fullWord: 'nun'),
  PhonicsWord(onset: 'p', rime: 'un', fullWord: 'pun'),
  PhonicsWord(onset: 'r', rime: 'un', fullWord: 'run'),
  PhonicsWord(onset: 's', rime: 'un', fullWord: 'sun'),
];
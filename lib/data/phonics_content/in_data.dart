// lib/data/phonics_content/in_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> inFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'in', fullWord: 'bin'),
  PhonicsWord(onset: 'd', rime: 'in', fullWord: 'din'),
  PhonicsWord(onset: 'f', rime: 'in', fullWord: 'fin'),
  PhonicsWord(onset: 'k', rime: 'in', fullWord: 'kin'),
  PhonicsWord(onset: 'p', rime: 'in', fullWord: 'pin'),
  PhonicsWord(onset: 's', rime: 'in', fullWord: 'sin'),
  PhonicsWord(onset: 't', rime: 'in', fullWord: 'tin'),
  PhonicsWord(onset: 'w', rime: 'in', fullWord: 'win'),
];
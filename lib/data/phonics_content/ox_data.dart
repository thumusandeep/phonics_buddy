// lib/data/phonics_content/ox_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> oxFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ox', fullWord: 'box'),
  PhonicsWord(onset: 'f', rime: 'ox', fullWord: 'fox'),
  PhonicsWord(onset: 'p', rime: 'ox', fullWord: 'pox'),
];
// lib/data/phonics_content/an_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> anFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'an', fullWord: 'ban'),
  PhonicsWord(onset: 'c', rime: 'an', fullWord: 'can'),
  PhonicsWord(onset: 'f', rime: 'an', fullWord: 'fan'),
  PhonicsWord(onset: 'm', rime: 'an', fullWord: 'man'),
  PhonicsWord(onset: 'p', rime: 'an', fullWord: 'pan'),
  PhonicsWord(onset: 'r', rime: 'an', fullWord: 'ran'),
  PhonicsWord(onset: 't', rime: 'an', fullWord: 'tan'),
  PhonicsWord(onset: 'v', rime: 'an', fullWord: 'van'),
];
// lib/data/phonics_content/ent_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> entFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ent', fullWord: 'bent'),
  PhonicsWord(onset: 'd', rime: 'ent', fullWord: 'dent'),
  PhonicsWord(onset: 'l', rime: 'ent', fullWord: 'lent'),
  PhonicsWord(onset: 'r', rime: 'ent', fullWord: 'rent'),
  PhonicsWord(onset: 's', rime: 'ent', fullWord: 'sent'),
  PhonicsWord(onset: 't', rime: 'ent', fullWord: 'tent'),
  PhonicsWord(onset: 'v', rime: 'ent', fullWord: 'vent'),
  PhonicsWord(onset: 'w', rime: 'ent', fullWord: 'went'),
];
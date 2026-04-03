// lib/data/phonics_content/uck_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> uckFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'uck', fullWord: 'buck'),
  PhonicsWord(onset: 'd', rime: 'uck', fullWord: 'duck'),
  PhonicsWord(onset: 'l', rime: 'uck', fullWord: 'luck'),
  PhonicsWord(onset: 'm', rime: 'uck', fullWord: 'muck'),
  PhonicsWord(onset: 'p', rime: 'uck', fullWord: 'puck'),
  PhonicsWord(onset: 's', rime: 'uck', fullWord: 'suck'),
  PhonicsWord(onset: 't', rime: 'uck', fullWord: 'tuck'),
];
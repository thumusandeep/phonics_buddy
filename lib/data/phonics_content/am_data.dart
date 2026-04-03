// lib/data/phonics_content/am_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> amFamilyWords = [
  PhonicsWord(onset: 'h', rime: 'am', fullWord: 'ham'),
  PhonicsWord(onset: 'j', rime: 'am', fullWord: 'jam'),
  PhonicsWord(onset: 'r', rime: 'am', fullWord: 'ram'),
  PhonicsWord(onset: 'y', rime: 'am', fullWord: 'yam'),
];
// lib/data/phonics_content/ud_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> udFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ud', fullWord: 'bud'),
  PhonicsWord(onset: 'c', rime: 'ud', fullWord: 'cud'),
  PhonicsWord(onset: 'm', rime: 'ud', fullWord: 'mud'),
];
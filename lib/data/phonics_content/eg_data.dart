// lib/data/phonics_content/eg_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> egFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'eg', fullWord: 'beg'),
  PhonicsWord(onset: 'k', rime: 'eg', fullWord: 'keg'),
  PhonicsWord(onset: 'l', rime: 'eg', fullWord: 'leg'),
  PhonicsWord(onset: 'p', rime: 'eg', fullWord: 'peg'),
];
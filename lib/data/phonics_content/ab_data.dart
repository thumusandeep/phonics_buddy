// lib/data/phonics_content/ab_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> abFamilyWords = [
  PhonicsWord(onset: 'c', rime: 'ab', fullWord: 'cab'),
  PhonicsWord(onset: 'd', rime: 'ab', fullWord: 'dab'),
  PhonicsWord(onset: 'g', rime: 'ab', fullWord: 'gab'),
  PhonicsWord(onset: 'j', rime: 'ab', fullWord: 'jab'),
  PhonicsWord(onset: 'l', rime: 'ab', fullWord: 'lab'),
  PhonicsWord(onset: 'n', rime: 'ab', fullWord: 'nab'),
  PhonicsWord(onset: 't', rime: 'ab', fullWord: 'tab'),
];
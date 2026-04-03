// lib/data/phonics_content/ub_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> ubFamilyWords = [
  PhonicsWord(onset: 'c', rime: 'ub', fullWord: 'cub'),
  PhonicsWord(onset: 'h', rime: 'ub', fullWord: 'hub'),
  PhonicsWord(onset: 'n', rime: 'ub', fullWord: 'nub'),
  PhonicsWord(onset: 'p', rime: 'ub', fullWord: 'pub'),
  PhonicsWord(onset: 'r', rime: 'ub', fullWord: 'rub'),
  PhonicsWord(onset: 's', rime: 'ub', fullWord: 'sub'),
  PhonicsWord(onset: 't', rime: 'ub', fullWord: 'tub'),
];
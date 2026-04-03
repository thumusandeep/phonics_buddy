// lib/data/phonics_content/ick_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> ickFamilyWords = [
  PhonicsWord(onset: 'k', rime: 'ick', fullWord: 'kick'),
  PhonicsWord(onset: 'l', rime: 'ick', fullWord: 'lick'),
  PhonicsWord(onset: 'n', rime: 'ick', fullWord: 'nick'),
  PhonicsWord(onset: 'p', rime: 'ick', fullWord: 'pick'),
  PhonicsWord(onset: 'q', rime: 'uick', fullWord: 'quick'),
  PhonicsWord(onset: 's', rime: 'ick', fullWord: 'sick'),
  PhonicsWord(onset: 't', rime: 'ick', fullWord: 'tick'),
  PhonicsWord(onset: 'w', rime: 'ick', fullWord: 'wick'),
];
// lib/data/phonics_content/est_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> estFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'est', fullWord: 'best'),
  PhonicsWord(onset: 'j', rime: 'est', fullWord: 'jest'),
  PhonicsWord(onset: 'l', rime: 'est', fullWord: 'lest'),
  PhonicsWord(onset: 'n', rime: 'est', fullWord: 'nest'),
  PhonicsWord(onset: 'p', rime: 'est', fullWord: 'pest'),
  PhonicsWord(onset: 'r', rime: 'est', fullWord: 'rest'),
  PhonicsWord(onset: 't', rime: 'est', fullWord: 'test'),
  PhonicsWord(onset: 'v', rime: 'est', fullWord: 'vest'),
  PhonicsWord(onset: 'w', rime: 'est', fullWord: 'west'),
];
// lib/data/phonics_content/ell_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> ellFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ell', fullWord: 'bell'),
  PhonicsWord(onset: 'f', rime: 'ell', fullWord: 'fell'),
  PhonicsWord(onset: 's', rime: 'ell', fullWord: 'sell'),
  PhonicsWord(onset: 't', rime: 'ell', fullWord: 'tell'),
  PhonicsWord(onset: 'w', rime: 'ell', fullWord: 'well'),
  PhonicsWord(onset: 'y', rime: 'ell', fullWord: 'yell'),
];
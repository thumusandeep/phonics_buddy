// lib/data/phonics_content/en_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> enFamilyWords = [
  PhonicsWord(onset: 'd', rime: 'en', fullWord: 'den'),
  PhonicsWord(onset: 'h', rime: 'en', fullWord: 'hen'),
  PhonicsWord(onset: 'm', rime: 'en', fullWord: 'men'),
  PhonicsWord(onset: 'p', rime: 'en', fullWord: 'pen'),
  PhonicsWord(onset: 't', rime: 'en', fullWord: 'ten'),
];
// lib/data/phonics_content/ap_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> apFamilyWords = [
  PhonicsWord(onset: 'c', rime: 'ap', fullWord: 'cap'),
  PhonicsWord(onset: 'g', rime: 'ap', fullWord: 'gap'),
  PhonicsWord(onset: 'l', rime: 'ap', fullWord: 'lap'),
  PhonicsWord(onset: 'm', rime: 'ap', fullWord: 'map'),
  PhonicsWord(onset: 'n', rime: 'ap', fullWord: 'nap'),
  PhonicsWord(onset: 't', rime: 'ap', fullWord: 'tap'),
  PhonicsWord(onset: 'z', rime: 'ap', fullWord: 'zap'),
];
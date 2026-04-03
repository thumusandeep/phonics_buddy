// lib/data/phonics_content/ill_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> illFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ill', fullWord: 'bill'),
  PhonicsWord(onset: 'f', rime: 'ill', fullWord: 'fill'),
  PhonicsWord(onset: 'g', rime: 'ill', fullWord: 'gill'),
  PhonicsWord(onset: 'h', rime: 'ill', fullWord: 'hill'),
  PhonicsWord(onset: 'k', rime: 'ill', fullWord: 'kill'),
  PhonicsWord(onset: 'm', rime: 'ill', fullWord: 'mill'),
  PhonicsWord(onset: 'p', rime: 'ill', fullWord: 'pill'),
  PhonicsWord(onset: 't', rime: 'ill', fullWord: 'till'),
  PhonicsWord(onset: 'w', rime: 'ill', fullWord: 'will'),
];
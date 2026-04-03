// lib/data/phonics_content/at_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> atFamilyWords = [
  PhonicsWord(onset: 'B', rime: 'at', fullWord: 'Bat'),
  PhonicsWord(onset: 'C', rime: 'at', fullWord: 'Cat'),
  PhonicsWord(onset: 'F', rime: 'at', fullWord: 'Fat'),
  PhonicsWord(onset: 'H', rime: 'at', fullWord: 'Hat'),
  PhonicsWord(onset: 'M', rime: 'at', fullWord: 'Mat'),
  PhonicsWord(onset: 'P', rime: 'at', fullWord: 'Pat'),
  PhonicsWord(onset: 'R', rime: 'at', fullWord: 'Rat'),
  PhonicsWord(onset: 'S', rime: 'at', fullWord: 'Sat'),
  PhonicsWord(onset: 'V', rime: 'at', fullWord: 'Vat'),
];
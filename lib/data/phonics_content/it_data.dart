// lib/data/phonics_content/it_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> itFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'it', fullWord: 'bit'),
  PhonicsWord(onset: 'f', rime: 'it', fullWord: 'fit'),
  PhonicsWord(onset: 'h', rime: 'it', fullWord: 'hit'),
  PhonicsWord(onset: 'k', rime: 'it', fullWord: 'kit'),
  PhonicsWord(onset: 'l', rime: 'it', fullWord: 'lit'),
  PhonicsWord(onset: 'p', rime: 'it', fullWord: 'pit'),
  PhonicsWord(onset: 's', rime: 'it', fullWord: 'sit'),
  PhonicsWord(onset: 'w', rime: 'it', fullWord: 'wit'),
];
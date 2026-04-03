// lib/data/phonics_content/et_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> etFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'et', fullWord: 'bet'),
  PhonicsWord(onset: 'g', rime: 'et', fullWord: 'get'),
  PhonicsWord(onset: 'j', rime: 'et', fullWord: 'jet'),
  PhonicsWord(onset: 'l', rime: 'et', fullWord: 'let'),
  PhonicsWord(onset: 'm', rime: 'et', fullWord: 'met'),
  PhonicsWord(onset: 'n', rime: 'et', fullWord: 'net'),
  PhonicsWord(onset: 'p', rime: 'et', fullWord: 'pet'),
  PhonicsWord(onset: 's', rime: 'et', fullWord: 'set'),
  PhonicsWord(onset: 'w', rime: 'et', fullWord: 'wet'),
];
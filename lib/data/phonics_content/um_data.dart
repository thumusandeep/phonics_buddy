// lib/data/phonics_content/um_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> umFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'um', fullWord: 'bum'),
  PhonicsWord(onset: 'g', rime: 'um', fullWord: 'gum'),
  PhonicsWord(onset: 'h', rime: 'um', fullWord: 'hum'),
  PhonicsWord(onset: 'm', rime: 'um', fullWord: 'mum'),
  PhonicsWord(onset: 's', rime: 'um', fullWord: 'sum'),
  PhonicsWord(onset: 'y', rime: 'um', fullWord: 'yum'),
];
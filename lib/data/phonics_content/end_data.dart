// lib/data/phonics_content/end_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> endFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'end', fullWord: 'bend'),
  PhonicsWord(onset: 'l', rime: 'end', fullWord: 'lend'),
  PhonicsWord(onset: 'm', rime: 'end', fullWord: 'mend'),
  PhonicsWord(onset: 's', rime: 'end', fullWord: 'send'),
  PhonicsWord(onset: 't', rime: 'end', fullWord: 'tend'),
  PhonicsWord(onset: 'v', rime: 'end', fullWord: 'vend'),
];
// lib/data/phonics_content/ag_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> agFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ag', fullWord: 'bag'),
  PhonicsWord(onset: 'l', rime: 'ag', fullWord: 'lag'),
  PhonicsWord(onset: 'n', rime: 'ag', fullWord: 'nag'),
  PhonicsWord(onset: 'r', rime: 'ag', fullWord: 'rag'),
  PhonicsWord(onset: 's', rime: 'ag', fullWord: 'sag'),
  PhonicsWord(onset: 't', rime: 'ag', fullWord: 'tag'),
  PhonicsWord(onset: 'w', rime: 'ag', fullWord: 'wag'),
  PhonicsWord(onset: 'z', rime: 'ag', fullWord: 'zag'),
];

// lib/data/phonics_content/im_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> imFamilyWords = [
  PhonicsWord(onset: 'd', rime: 'im', fullWord: 'dim'),
  PhonicsWord(onset: 'h', rime: 'im', fullWord: 'him'),
  PhonicsWord(onset: 'j', rime: 'im', fullWord: 'jim'),
  PhonicsWord(onset: 'r', rime: 'im', fullWord: 'rim'),
  PhonicsWord(onset: 't', rime: 'im', fullWord: 'tim'),
];
// lib/data/phonics_content/ug_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> ugFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ug', fullWord: 'bug'),
  PhonicsWord(onset: 'd', rime: 'ug', fullWord: 'dug'),
  PhonicsWord(onset: 'h', rime: 'ug', fullWord: 'hug'),
  PhonicsWord(onset: 'j', rime: 'ug', fullWord: 'jug'),
  PhonicsWord(onset: 'l', rime: 'ug', fullWord: 'lug'),
  PhonicsWord(onset: 'm', rime: 'ug', fullWord: 'mug'),
  PhonicsWord(onset: 'p', rime: 'ug', fullWord: 'pug'),
  PhonicsWord(onset: 'r', rime: 'ug', fullWord: 'rug'),
  PhonicsWord(onset: 't', rime: 'ug', fullWord: 'tug'),
];
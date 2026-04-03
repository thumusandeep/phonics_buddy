// lib/data/phonics_content/ob_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> obFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ob', fullWord: 'bob'),
  PhonicsWord(onset: 'c', rime: 'ob', fullWord: 'cob'),
  PhonicsWord(onset: 'j', rime: 'ob', fullWord: 'job'),
  PhonicsWord(onset: 'l', rime: 'ob', fullWord: 'lob'),
  PhonicsWord(onset: 'm', rime: 'ob', fullWord: 'mob'),
  PhonicsWord(onset: 'r', rime: 'ob', fullWord: 'rob'),
  PhonicsWord(onset: 's', rime: 'ob', fullWord: 'sob'),
];
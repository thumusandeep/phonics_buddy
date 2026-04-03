// lib/data/phonics_content/ig_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> igFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ig', fullWord: 'big'),
  PhonicsWord(onset: 'd', rime: 'ig', fullWord: 'dig'),
  PhonicsWord(onset: 'f', rime: 'ig', fullWord: 'fig'),
  PhonicsWord(onset: 'g', rime: 'ig', fullWord: 'gig'),
  PhonicsWord(onset: 'j', rime: 'ig', fullWord: 'jig'),
  PhonicsWord(onset: 'p', rime: 'ig', fullWord: 'pig'),
  PhonicsWord(onset: 'r', rime: 'ig', fullWord: 'rig'),
  PhonicsWord(onset: 'w', rime: 'ig', fullWord: 'wig'),
];
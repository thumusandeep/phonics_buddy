// lib/data/phonics_content/id_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> idFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'id', fullWord: 'bid'),
  PhonicsWord(onset: 'd', rime: 'id', fullWord: 'did'),
  PhonicsWord(onset: 'h', rime: 'id', fullWord: 'hid'),
  PhonicsWord(onset: 'k', rime: 'id', fullWord: 'kid'),
  PhonicsWord(onset: 'l', rime: 'id', fullWord: 'lid'),
  PhonicsWord(onset: 'm', rime: 'id', fullWord: 'mid'),
  PhonicsWord(onset: 'r', rime: 'id', fullWord: 'rid'),
];
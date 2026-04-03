// lib/data/phonics_content/ock_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> ockFamilyWords = [
  PhonicsWord(onset: 'd', rime: 'ock', fullWord: 'dock'),
  PhonicsWord(onset: 'l', rime: 'ock', fullWord: 'lock'),
  PhonicsWord(onset: 'm', rime: 'ock', fullWord: 'mock'),
  PhonicsWord(onset: 'p', rime: 'ock', fullWord: 'pock'),
  PhonicsWord(onset: 'r', rime: 'ock', fullWord: 'rock'),
  PhonicsWord(onset: 's', rime: 'ock', fullWord: 'sock'),
  PhonicsWord(onset: 't', rime: 'ock', fullWord: 'tock'),
];
// lib/data/phonics_content/ack_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> ackFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ack', fullWord: 'back'),
  PhonicsWord(onset: 'h', rime: 'ack', fullWord: 'hack'),
  PhonicsWord(onset: 'j', rime: 'ack', fullWord: 'jack'),
  PhonicsWord(onset: 'l', rime: 'ack', fullWord: 'lack'),
  PhonicsWord(onset: 'p', rime: 'ack', fullWord: 'pack'),
  PhonicsWord(onset: 'r', rime: 'ack', fullWord: 'rack'),
  PhonicsWord(onset: 's', rime: 'ack', fullWord: 'sack'),
  PhonicsWord(onset: 't', rime: 'ack', fullWord: 'tack'),
];
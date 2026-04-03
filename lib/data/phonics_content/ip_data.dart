// lib/data/phonics_content/ip_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> ipFamilyWords = [
  PhonicsWord(onset: 'd', rime: 'ip', fullWord: 'dip'),
  PhonicsWord(onset: 'h', rime: 'ip', fullWord: 'hip'),
  PhonicsWord(onset: 'l', rime: 'ip', fullWord: 'lip'),
  PhonicsWord(onset: 'n', rime: 'ip', fullWord: 'nip'),
  PhonicsWord(onset: 'r', rime: 'ip', fullWord: 'rip'),
  PhonicsWord(onset: 's', rime: 'ip', fullWord: 'sip'),
  PhonicsWord(onset: 't', rime: 'ip', fullWord: 'tip'),
  PhonicsWord(onset: 'z', rime: 'ip', fullWord: 'zip'),
];
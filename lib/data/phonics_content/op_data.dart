// lib/data/phonics_content/op_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> opFamilyWords = [
  PhonicsWord(onset: 'c', rime: 'op', fullWord: 'cop'),
  PhonicsWord(onset: 'h', rime: 'op', fullWord: 'hop'),
  PhonicsWord(onset: 'm', rime: 'op', fullWord: 'mop'),
  PhonicsWord(onset: 'p', rime: 'op', fullWord: 'pop'),
  PhonicsWord(onset: 't', rime: 'op', fullWord: 'top'),
];
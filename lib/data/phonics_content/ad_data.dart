class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> adFamilyWords = [
  PhonicsWord(onset: 'B', rime: 'ad', fullWord: 'Bad'),
  PhonicsWord(onset: 'D', rime: 'ad', fullWord: 'Dad'),
  PhonicsWord(onset: 'H', rime: 'ad', fullWord: 'Had'),
  PhonicsWord(onset: 'L', rime: 'ad', fullWord: 'Lad'),
  PhonicsWord(onset: 'P', rime: 'ad', fullWord: 'Pad'),
  PhonicsWord(onset: 'S', rime: 'ad', fullWord: 'Sad'),
  PhonicsWord(onset: 'M', rime: 'ad', fullWord: 'Mad'),
];
// lib/data/phonics_content/od_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> odFamilyWords = [
  PhonicsWord(onset: 'c', rime: 'od', fullWord: 'cod'),
  PhonicsWord(onset: 'g', rime: 'od', fullWord: 'god'),
  PhonicsWord(onset: 'm', rime: 'od', fullWord: 'mod'),
  PhonicsWord(onset: 'n', rime: 'od', fullWord: 'nod'),
  PhonicsWord(onset: 'p', rime: 'od', fullWord: 'pod'),
  PhonicsWord(onset: 'r', rime: 'od', fullWord: 'rod'),
  PhonicsWord(onset: 's', rime: 'od', fullWord: 'sod'),
];
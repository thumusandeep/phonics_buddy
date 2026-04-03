// lib/data/phonics_content/up_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> upFamilyWords = [
  PhonicsWord(onset: 'c', rime: 'up', fullWord: 'cup'),
  PhonicsWord(onset: 'p', rime: 'up', fullWord: 'pup'),
  PhonicsWord(onset: 's', rime: 'up', fullWord: 'sup'),
];
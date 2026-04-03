// lib/data/phonics_content/ad_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> adFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'ad', fullWord: 'bad'),
  PhonicsWord(onset: 'd', rime: 'ad', fullWord: 'dad'),
  PhonicsWord(onset: 'h', rime: 'ad', fullWord: 'had'),
  PhonicsWord(onset: 'l', rime: 'ad', fullWord: 'lad'),
  PhonicsWord(onset: 'm', rime: 'ad', fullWord: 'mad'),
  PhonicsWord(onset: 'p', rime: 'ad', fullWord: 'pad'),
  PhonicsWord(onset: 's', rime: 'ad', fullWord: 'sad'),
];
// lib/data/phonics_content/og_data.dart

class PhonicsWord {
  final String onset;    
  final String rime;     
  final String fullWord; 

  PhonicsWord({required this.onset, required this.rime, required this.fullWord});
}

final List<PhonicsWord> ogFamilyWords = [
  PhonicsWord(onset: 'b', rime: 'og', fullWord: 'bog'),
  PhonicsWord(onset: 'c', rime: 'og', fullWord: 'cog'),
  PhonicsWord(onset: 'd', rime: 'og', fullWord: 'dog'),
  PhonicsWord(onset: 'f', rime: 'og', fullWord: 'fog'),
  PhonicsWord(onset: 'h', rime: 'og', fullWord: 'hog'),
  PhonicsWord(onset: 'j', rime: 'og', fullWord: 'jog'),
  PhonicsWord(onset: 'l', rime: 'og', fullWord: 'log'),
];
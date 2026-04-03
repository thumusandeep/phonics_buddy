import 'package:flutter/material.dart';

class VowelFolder extends StatelessWidget {
  final String title;
  final String phonetic;
  final List<Map<String, dynamic>> rimes;
  final Function(Widget) onSelect;

  const VowelFolder({
    super.key,
    required this.title,
    required this.phonetic,
    required this.rimes,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Icon(Icons.subtitles, size: 18),
      ),
      title: Text("$title - $phonetic"),
      children: rimes.map((rime) {
        return ListTile(
          contentPadding: const EdgeInsets.only(left: 50),
          title: Text("'${rime['name']}' ${rime['ipa'] ?? ''}"),
          onTap: () {
            onSelect(rime['screen']);
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
        );
      }).toList(),
    );
  }
}
import 'package:flutter/material.dart';
import 'all_lessons.dart';
import 'package:flutter/services.dart'; 
import '../../widgets/coming_soon_view.dart';
import '../../widgets/vowel_folder.dart';

class DashboardLayout extends StatefulWidget {
  @override
  _DashboardLayoutState createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  // This variable holds the current screen being displayed
  Widget _currentScreen = Center(child: Text("Select a lesson from the menu"));

  void _updateScreen(Widget screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  @override
  void initState() {
    super.initState();
    
    // This hides both the status bar (top) and navigation bar (bottom)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    drawerEdgeDragWidth: 40;
    bool isMobile = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      // ON MOBILE: This adds the "Hamburger" icon and hides the menu
      // ON DESKTOP: This is ignored if we show the sidebar manually
      drawer: isMobile ? Drawer(child: _buildSidebarContent()) : null,
      
      appBar: isMobile 
        ? AppBar(
            title: const Text("Phonics Buddy", style: TextStyle(fontSize: 18)),
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.blue),
          ) 
        : null,
      body: Row(
        children: [
        // IF NOT MOBILE: Show the permanent sidebar on the left
        if (!isMobile)
          Container(
            width: 280,
            color: Colors.white,
            child: _buildSidebarContent(),
          ),            
          Expanded(
            child: _currentScreen,
          ),
        ],
      ),
    );
  }
  Widget _buildSidebarContent() {
    return ListView(
      children: [
        // ... your DrawerHeader, Vowels, Consonants, and Blends code here ...
        // 1. VOWELS
        ListTile(
          title: const Text("Vowels", style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () {
              _updateScreen(VowelsView());
              // IMPORTANT: This hides the drawer after she picks a page
              if (Navigator.canPop(context)) Navigator.pop(context);
          },
        ),

        // 2. CONSONANTS
        ListTile(
          title: const Text("Consonants", style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () {
            _updateScreen(ConsonantsView());
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
        ),
        // const Divider(),

        //FOLDER 3: Blends
        ExpansionTile(
          leading: Icon(Icons.folder_open, color: Colors.orange),
          title: Text("Word Families/Rimes", style: TextStyle(fontWeight: FontWeight.bold)),
          children: [
            // SUB-FOLDER: Short 'a'
            VowelFolder(
              title: "Short 'a'",
              phonetic: "/æ/",
              onSelect: _updateScreen,
              rimes: [
                {'name': '-at', 'ipa': '/æt/', 'screen': AtBlendScreen()},
                {'name': '-an', 'ipa': '/æn/', 'screen': AnBlendScreen()},
                {'name': '-am', 'ipa': '/æm/', 'screen': AmBlendScreen()},
                {'name': '-ap', 'ipa': '/æp/', 'screen': ApBlendScreen()},
                {'name': '-ad', 'ipa': '/æd/', 'screen': AdBlendScreen()},
                {'name': '-ag', 'ipa': '/æɡ/', 'screen': AgBlendScreen()},
                {'name': '-ab', 'ipa': '/æb/', 'screen': AbBlendScreen()},
                {'name': '-ack', 'ipa': '/æk/', 'screen': AckBlendScreen()},
              ],
            ),
            // // SUB-FOLDER: Short 'e'
            VowelFolder(
              title: "Short 'e'",
              phonetic: "/ɛ/",
              onSelect: _updateScreen,
              rimes: [
                {'name': '-et', 'ipa': '/ɛt/', 'screen': EtBlendScreen()},
                {'name': '-ed', 'ipa': '/ɛd/', 'screen': EdBlendScreen()},
                {'name': '-en', 'ipa': '/ɛn/', 'screen': EnBlendScreen()},
                {'name': '-eg', 'ipa': '/ɛɡ/', 'screen': EgBlendScreen()},
                {'name': '-ell', 'ipa': '/ɛl/', 'screen': EllBlendScreen()},
                {'name': '-est', 'ipa': '/ɛst/', 'screen': EstBlendScreen()},
                {'name': '-end', 'ipa': '/ɛnd/', 'screen': EndBlendScreen()},
                {'name': '-ent', 'ipa': '/ɛnt/', 'screen': EntBlendScreen()},
              ],
            ),
            // // SUB-FOLDER: Short 'i'
            VowelFolder(
              title: "Short 'i'",
              phonetic: "/ɪ/",
              onSelect: _updateScreen,
              rimes: [
                {'name': '-it', 'ipa': '/ɪt/', 'screen': ItBlendScreen()},
                {'name': '-in', 'ipa': '/ɪn/', 'screen': InBlendScreen()},
                {'name': '-ip', 'ipa': '/ɪp/', 'screen': IpBlendScreen()},
                {'name': '-ig', 'ipa': '/ɪɡ/', 'screen': IgBlendScreen()},
                {'name': '-id', 'ipa': '/ɪd/', 'screen': IdBlendScreen()},
                {'name': '-im', 'ipa': '/ɪm/', 'screen': ImBlendScreen()},
                {'name': '-ill', 'ipa': '/ɪl/', 'screen': IllBlendScreen()},
                {'name': '-ick', 'ipa': '/ɪk/', 'screen': IckBlendScreen()},

              ],
            ),
            // // SUB-FOLDER: Short 'o'
            VowelFolder(
              title: "Short 'o'",
              phonetic: "/ɒ/",
              onSelect: _updateScreen,
              rimes: [
                {'name': '-ot', 'ipa': '/ɒt/', 'screen': OtBlendScreen()},
                {'name': '-op', 'ipa': '/ɒp/', 'screen': OpBlendScreen()},
                {'name': '-og', 'ipa': '/ɒɡ/', 'screen': OgBlendScreen()},
                {'name': '-ob', 'ipa': '/ɒb/', 'screen': ObBlendScreen()},
                {'name': '-od', 'ipa': '/ɒd/', 'screen': OdBlendScreen()},
                {'name': '-ox', 'ipa': '/ɒks/', 'screen': OxBlendScreen()},
                {'name': '-ock', 'ipa': '/ɒk/', 'screen': OckBlendScreen()},

              ],
            ),
            // // SUB-FOLDER: Short 'u'
            VowelFolder(
              title: "Short 'u'",
              phonetic: "/ʌ/",
              onSelect: _updateScreen,
              rimes: [
                {'name': '-ut', 'ipa': '/ʌt/', 'screen': UtBlendScreen()},
                {'name': '-un', 'ipa': '/ʌn/', 'screen': UnBlendScreen()},
                {'name': '-ug', 'ipa': '/ʌɡ/', 'screen': UgBlendScreen()},
                {'name': '-ub', 'ipa': '/ʌb/', 'screen': UbBlendScreen()},
                {'name': '-ud', 'ipa': '/ʌd/', 'screen': UdBlendScreen()},
                {'name': '-um', 'ipa': '/ʌm/', 'screen': UmBlendScreen()},
                {'name': '-up', 'ipa': '/ʌp/', 'screen': UpBlendScreen()},
                {'name': '-uck', 'ipa': '/ʌk/', 'screen': UckBlendScreen()},
              ],
            ),
          ],
        ),
        // ... repeat for other items ...
      ],
    );
  }
}
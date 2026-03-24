import 'package:flutter/material.dart';
import 'ad_blend.dart'; // The file we just created
import 'consonants_view.dart';
import 'vowels_view.dart';
import 'package:flutter/services.dart'; 

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

        //FOLDER 3: Short Blends
        ExpansionTile(
          leading: Icon(Icons.folder_open, color: Colors.orange),
          title: Text("Short Blends", style: TextStyle(fontWeight: FontWeight.bold)),
          children: [
            // SUB-FOLDER: Short 'a'
            ExpansionTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(Icons.subtitles, size: 18),
              ),
              title: Text("Short 'a' - /æ/ "),
              children: [
                // ITEM: 'ad' blend
                ListTile(
                  contentPadding: EdgeInsets.only(left: 50),
                  title: Text("'ad' Blend family"),
                  onTap: () {
                    _updateScreen(AdBlendScreen());
                    if (Navigator.canPop(context)) Navigator.pop(context);
                    Icon(Icons.arrow_right);
                  },
                ),
                // Placeholder for future blends
                ListTile(
                  contentPadding: EdgeInsets.only(left: 50),
                  title: Text("'at' Blend (Soon)"),
                  onTap: () {
                    // coming soon...
                  }, 
                ),
              ],
            ),
          ],
        ),
        // ... repeat for other items ...
      ],
    );
  }
}
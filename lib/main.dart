import 'package:flutter/material.dart';

import 'challenge_friend_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SettingsProfileScreen(),
    );
  }
}

class SettingsProfileScreen extends StatefulWidget {
  @override
  _SettingsProfileScreenState createState() => _SettingsProfileScreenState();
}

class _SettingsProfileScreenState extends State<SettingsProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _currentPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  Set<String> selectedInterests = {};
  bool notificationsEnabled = true;
  String selectedLanguage = 'English';
  String selectedTheme = 'Dark';

  final List<String> interests = [
    'Mindfulness', 'Stress Relief', 'Nutrition',
    'Entrepreneurship', 'Motivation', 'Confidence'
  ];

  final List<String> languages = ['English', 'Spanish', 'French', 'German'];
  final List<String> themes = ['Dark', 'Light', 'System'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191d2d),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Settings', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            child: Text('Save', style: TextStyle(color: Color(0xFFFBC02D))),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF081A29),
                  borderRadius: BorderRadius.circular(16),
                ),
                // Remove the color property from here
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Profile Information",
                          style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xFFFBC02D),
                            child: Icon(Icons.waving_hand, color: Colors.black, size: 32),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Username',
                                style: TextStyle(color: Color(0xFFFBC02D), fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: TextField(
                                  controller: _usernameController,
                                  style: TextStyle(color: Colors.white),
                                  minLines: 1,
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    hintText: "Username",
                                    hintStyle: TextStyle(color: Colors.white54),
                                    filled: true,
                                    fillColor: Color(0xFF1E293B),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Bio",
                          style: TextStyle(color: Color(0xFFCB9821), fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextField(
                        controller: _bioController,
                        style: TextStyle(color: Colors.white),
                        minLines: 3,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Bio",
                          hintStyle: TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Color(0xFF1E293B),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Align(alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 50,

                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Updated!')),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFCB9821),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                elevation: 0,
                              ),
                              child: Text(
                                "Save Changes",
                                style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF081A29),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "My Interests",
                          style: TextStyle(color: Colors.white, fontFamily: 'Inter',fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: interests.map((interest) {
                        bool isSelected = selectedInterests.contains(interest);
                        return FilterChip(
                          label: Text(interest),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedInterests.add(interest);
                              } else {
                                selectedInterests.remove(interest);
                              }
                            });
                          },
                          selectedColor: Color(0xFFFCB9821),
                          checkmarkColor: Colors.black,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.black : Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: 'Inter',
                          ),
                          backgroundColor: Color(0xFF1E293B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Interests updated!')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFCB9821),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            elevation: 0,
                          ),
                          child: Text(
                            "Save Changes",
                            style: TextStyle(color: Colors.white, fontFamily: 'Poppins',fontWeight: FontWeight.w600, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF081A29),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0,),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Account Security",
                          style: TextStyle(color: Colors.white, fontFamily: 'Inter',fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Change Password",
                          style: TextStyle(color: Color(0xFFCB9821), fontFamily: 'Poppins',fontSize: 16, fontWeight: FontWeight.w600),
                        ),

                      ),
                    ),
                    SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    controller: _currentPassController,
                    //obscureText: obscure,
                    style: TextStyle(color: Colors.white),
                    minLines: 1,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Current Password",
                      hintStyle: TextStyle(color: Colors.white54, fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 14),
                      filled: true,
                      fillColor: Color(0xFF1E293B),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    controller: _newPassController,
                   // obscureText: obscure,
                    style: TextStyle(color: Colors.white),
                    minLines: 1,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "New Password",
                      hintStyle: TextStyle(color: Colors.white54,fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 14),
                      filled: true,
                      fillColor: Color(0xFF1E293B),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    controller: _confirmPassController,
                    //obscureText: obscure,
                    style: TextStyle(color: Colors.white),
                    minLines: 1,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.white54,fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 14),
                      filled: true,
                      fillColor: Color(0xFF1E293B),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFCB9821),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        elevation: 0,
                      ),
                      child: Text(
                        "Update Password",
                        style: TextStyle(color: Colors.white, fontFamily: 'Poppins',fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF081A29),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Data & Backup",
                          style: TextStyle(color: Colors.white,fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildIconButton(Icons.download, 'Export', () {}),
                        _buildIconButton(Icons.upload, 'Import', () {}),
                        _buildIconButton(Icons.delete, 'Delete', () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: Color(0xFF1E293B),
                              title: Text('Delete All Data?', style: TextStyle(color: Colors.white)),
                              content: Text('This action cannot be undone.', style: TextStyle(color: Colors.white70)),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx),
                                  child: Text('Cancel', style: TextStyle(color: Colors.white70)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('All data deleted')),
                                    );
                                  },
                                  child: Text('Delete', style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF081A29),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Preferences",
                          style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(

                      children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                          "Notifications ",
                          style: TextStyle(color: Color(0xFFCB9821), fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                    ),
                        Spacer(),


                        Checkbox(
                          value: notificationsEnabled,
                          onChanged: (bool? value) {
                            setState(() {
                              notificationsEnabled = value ?? false;
                            });
                          },
                          activeColor: Color(0xFFFBC02D),
                          checkColor: Colors.black,
                        ),
                      ],
                    ),

                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Language ",
                          style: TextStyle(color: Color(0xFFCB9821), fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ),
                    ),
                    _buildDropdownTile('Language', selectedLanguage, languages, (value) {
                      setState(() => selectedLanguage = value!);
                    }),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Theme",
                          style: TextStyle(color: Color(0xFFCB9821), fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ),
                    ),
                    _buildDropdownTile('Theme', selectedTheme, themes, (value) {
                      setState(() => selectedTheme = value!);
                    }),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25.09,bottom: 25.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChallengeFriendScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFBC02D),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    elevation: 0,
                  ),
                  child: Text(
                    "Challenge a Friend",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildIconButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF142C47CC),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(color: Colors.white, fontFamily: 'Inter',fontWeight: FontWeight.w400,fontSize: 12)),
        ],
      ),
    );
  }


  Widget _buildDropdownTile(
      String title, String value, List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(25),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            dropdownColor: Color(0xFF1E293B),
            style: TextStyle(color: Colors.white),
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.white70),
            items: items.map((item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
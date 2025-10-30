import 'package:flutter/material.dart';

class ChallengeFriendScreen extends StatefulWidget {
  @override
  _ChallengeFriendScreenState createState() => _ChallengeFriendScreenState();
}

class _ChallengeFriendScreenState extends State<ChallengeFriendScreen> {
  String? selectedMood;
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _friendController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String? selectedChallenge;

  final List<Map<String, String>> moods = [
    {'emoji': '😣', 'label': 'Angry', 'value': 'angry'},
    {'emoji': '😢', 'label': 'Sad', 'value': 'sad'},
    {'emoji': '😰', 'label': 'Anxious', 'value': 'anxious'},
    {'emoji': '😐', 'label': 'Neutral', 'value': 'neutral'},
    {'emoji': '😊', 'label': 'Good', 'value': 'good'},
    {'emoji': '😎', 'label': 'Alright', 'value': 'alright'},
  ];

  final List<String> challenges = [
    '7-Day Meditation Streak',
    'Daily Water Intake',
    'Morning Workout',
    'Read 10 Pages',
    'No Social Media After 9 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191d2d), // Dark navy background

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF081A29),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(alignment:Alignment.topLeft,child: Text("How are you feeling today?",
                        style: TextStyle(color: Colors.white,fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w600),),),
                    ),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: moods.map((mood) {
                        bool isSelected = selectedMood == mood['value'];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMood = mood['value'];
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Color(0xFFFBC02D)
                                      : Color(0xFF1E293B),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? Color(0xFFFBC02D)
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    mood['emoji']!,
                                    style: TextStyle(fontSize: 28),
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                mood['label']!,
                                style: TextStyle(
                                  color: isSelected
                                      ? Color(0xFFFBC02D)
                                      : Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),


                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextField(

                        style: TextStyle(color: Colors.white),
                        minLines: 3,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Add a quick note...",
                          hintStyle: TextStyle(color: Colors.white54, fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 12),
                          filled: true,
                          fillColor: Color(0xFF1E293B),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        children: [
                          OutlinedButton(
                            onPressed: (){},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xFF475569)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                            ),
                            child: Text("Clear", style: TextStyle(color: Colors.white70 ,fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 12),),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFBC02D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "Save Mood",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],

                ),
              ),
              SizedBox(height: 32),
              Container(
                height: 500,
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
                        child: Text("Send a Challenge Invitation",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                        ),

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Friend's Username or Email",
                          style: TextStyle(color: Color(0xFFCB9821), fontFamily:"Poppins", fontSize: 14, fontWeight: FontWeight.w600),
                        ),

                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextField(
                        controller: _friendController,
                        style: TextStyle(color: Colors.white),
                        minLines: 1,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "@Usename or Email",
                          hintStyle: TextStyle(color: Colors.white,fontFamily: "Inter", fontWeight: FontWeight.w400, fontSize: 14 ),
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
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Select Challenge",
                          style: TextStyle(color: Color(0xFFCB9821), fontFamily:"Poppins", fontSize: 14, fontWeight: FontWeight.w600),
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                      child: DropdownButtonFormField<String>(
                        value: selectedChallenge,
                        hint: Text('Select Challenge', style: TextStyle(color: Colors.white,fontFamily: "Inter", fontWeight: FontWeight.w400, fontSize: 14 ),),
                        dropdownColor: Color(0xFF1E293B),
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF1E293B),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                        items: challenges.map((challenge) {
                          return DropdownMenuItem(value: challenge, child: Text(challenge));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedChallenge = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Message",
                          style: TextStyle(color: Color(0xFFCB9821), fontFamily:"Poppins", fontSize: 14, fontWeight: FontWeight.w600),
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextField(
                        controller: _messageController,
                        style: TextStyle(color: Colors.white),
                        minLines: 3,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Write a Message...",
                          hintStyle: TextStyle(color: Colors.white,fontFamily: "Inter", fontWeight: FontWeight.w400, fontSize: 14 ),
                          filled: true,
                          fillColor: Color(0xFF1E293B),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_friendController.text.isNotEmpty &&
                                selectedChallenge != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Challenge sent to ${_friendController.text}!',
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please fill all fields')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFBC02D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            "Send Invitation",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    int minLines = 1,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Color(0xFF1E293B),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedChallenge,
      hint: Text('Select Challenge', style: TextStyle(color: Colors.white54)),
      dropdownColor: Color(0xFF1E293B),
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF1E293B),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      items: challenges.map((challenge) {
        return DropdownMenuItem(value: challenge, child: Text(challenge));
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedChallenge = value;
        });
      },
    );
  }

  Widget _buildPrimaryButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFBC02D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Color(0xFF475569)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
      child: Text(text, style: TextStyle(color: Colors.white70)),
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    _friendController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}

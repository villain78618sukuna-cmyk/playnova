import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Plugins ko bind karne ke liye zaroori hai
  WidgetsFlutterBinding.ensureInitialized();
  
  // Firebase ko initialize karein
  await Firebase.initializeApp();
  
  // PlayNovaApp ko run karein (jo aapke Line 19 me bani hui hai)
  runApp(const PlayNovaApp());
}


class PlayNovaApp extends StatelessWidget {
  const PlayNovaApp({super.key});

  @override
  Widget build(BuildContext context) {final List<String> messages = [
  "Hey, PlayNova app me aapka swagat hai!",
  "Firebase initialization setup ho gaya hai.",
  "Ab hum UI list view test kar rahe hain."
];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlayNova',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0d0d1f),
      ),
      home: const LoginScreen(),
    );
  }
}

// ================= 1. LOGIN SCREEN =================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff0f0c29),
              Color(0xff302b63),
              Color(0xff24243e),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Colors.purple, Colors.blue],
                          ),
                        ),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "PlayNova",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Social Gaming & Voice Chat",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                const Text(
                  "Phone Number",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white10,
                    prefixIcon: const Icon(Icons.phone, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      // Home Lobby par le jaane ke liye navigation
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
                      );
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
                      );
                    },
                    icon: const Icon(Icons.g_mobiledata, size: 35, color: Colors.white),
                    label: const Text(
                      "Continue with Google",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const Spacer(),
                const Center(
                  child: Text(
                    "By continuing you agree to PlayNova Terms & Privacy Policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= MAIN NAVIGATION (BOTTOM BAR CONTROLLER) =================
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // Tabs screens list
  final List<Widget> _screens = [
    const HomeLobby(),
    const Center(child: Text("Voice Rooms Screen (Coming Soon)", style: TextStyle(fontSize: 20))),
    const Center(child: Text("Games Marketplace (Coming Soon)", style: TextStyle(fontSize: 20))),
    const ChatPage(), // Chat tab connect kiya
    const Center(child: Text("Profile Screen (Coming Soon)", style: TextStyle(fontSize: 20))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xff16162b),
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: "Rooms"),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: "Games"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// ================= 2. HOME LOBBY SCREEN =================
class HomeLobby extends StatelessWidget {
  const HomeLobby({super.key});

  final List<Map<String, dynamic>> games = const [
    {"name": "Ludo", "icon": Icons.casino},
    {"name": "UNO Style", "icon": Icons.style},
    {"name": "Quiz Battle", "icon": Icons.quiz},
    {"name": "Drawing", "icon": Icons.brush},
    {"name": "Truth Dare", "icon": Icons.favorite},
    {"name": "Spin Bottle", "icon": Icons.rotate_right},
    {"name": "Cafe Cards", "icon": Icons.table_bar},
    {"name": "Who's Spy", "icon": Icons.visibility},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0d0d1f),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TOP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome Back 👋",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "PlayNova",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(Icons.notifications, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // PREMIUM BANNER
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Play With Friends",
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Voice rooms, multiplayer games & fun rewards.",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Start Now"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // TRENDING ROOMS
                const Text(
                  "Trending Voice Rooms",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 150,
                  child: ListView.generate(
                    5,
                    (index) => Container(
                      width: 220,
                      margin: const EdgeInsets.only(right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.purpleAccent,
                                  child: Icon(Icons.mic, color: Colors.white),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Fun Party",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              "12/20 Online",
                              style: TextStyle(color: Colors.white70, fontSize: 13),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purpleAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text("Join", style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),

                // POPULAR GAMES (Adhura Grid Yahan Poora Kiya Hai)
                const Text(
                  "Popular Games",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 14),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xff2a2a40), Color(0xff1d1d33)],
                        ),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(games[index]["icon"], size: 45, color: Colors.purpleAccent),
                          const SizedBox(height: 12),
                          Text(
                            games[index]["name"],
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Play", style: TextStyle(color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= 3. CHAT SCREEN =================
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      "sender": "NovaKing",
      "message": "Hey welcome to PlayNova 🔥",
      "isMe": false,
    },
    {
      "sender": "You",
      "message": "Thanks bro 😎",
      "isMe": true,
    },
    {
      "sender": "ShadowYT",
      "message": "Join our voice room!",
      "isMe": false,
    },
  ];

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    setState(() {
      messages.add({
        "sender": "You",
        "message": messageController.text,
        "isMe": true,
      });
    });

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0d0d1f),
      appBar: AppBar(
        backgroundColor: const Color(0xff16162b),
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.purpleAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Nova Squad",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  "Private Chat",
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(18),
              itemCount: messages.length,
              itemBuilder: (context, index) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    color: Colors.blueGrey[900],
    child: ListTile(
      leading: const Icon(Icons.message, color: Colors.tealAccent),
      title: Text(
        messages[index],
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
},

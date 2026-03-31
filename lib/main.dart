import 'package:flutter/material.dart';

void main() {
  runApp(const ImHereApp());
}

class ImHereApp extends StatelessWidget {
  const ImHereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I\'m Here',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF121212), // Arka plan rengi
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Color(0xFFEEDCBB),
          ), // Şampanya sarısı ikonlar
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _textController = TextEditingController();

  void _navigateToDisplayScreen(String message) {
    if (message.trim().isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayScreen(messageToShow: message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                "I'M HERE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFEEDCBB),
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Communication has no silence",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 50),
              TextField(
                controller: _textController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Type your message here...",
                  hintStyle: const TextStyle(color: Colors.white38),
                  filled: true,
                  fillColor: const Color(0xFF1E1E1E),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFFEEDCBB)),
                    onPressed: () {
                      _navigateToDisplayScreen(_textController.text);
                      _textController.clear();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Quick Cards",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildQuickCard(
                      icon: Icons.local_hospital,
                      title: "Hospital",
                      message:
                          "Hello, I am hearing impaired. I need to see a doctor. Where is the registration desk?",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildQuickCard(
                      icon: Icons.shopping_cart,
                      title: "Market",
                      message:
                          "Hello, I am hearing impaired. Can you please help me find an item in the store?",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildQuickCard(
                      icon: Icons.directions_bus,
                      title: "Transport",
                      message:
                          "Hello, I am hearing impaired. Which bus/train should I take to go to the city center?",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildQuickCard(
                      icon: Icons.warning_amber_rounded,
                      title: "Emergency",
                      message:
                          "EMERGENCY! I am hearing impaired and I need urgent help. Please contact the authorities.",
                      isEmergency: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickCard({
    required IconData icon,
    required String title,
    required String message,
    bool isEmergency = false,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isEmergency
            ? const Color(0xFF8B0000)
            : const Color(0xFF1E1E1E),
        padding: const EdgeInsets.symmetric(vertical: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isEmergency
                ? Colors.redAccent
                : Colors.blue.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
      ),
      onPressed: () => _navigateToDisplayScreen(message),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: isEmergency ? Colors.white : const Color(0xFFEEDCBB),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class DisplayScreen extends StatelessWidget {
  final String messageToShow;

  const DisplayScreen({super.key, required this.messageToShow});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Show This Screen",
          style: TextStyle(color: Colors.white54, fontSize: 16),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFEEDCBB)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Text(
              messageToShow,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

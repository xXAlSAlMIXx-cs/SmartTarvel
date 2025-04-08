import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: Image.asset("images/logo.png", height: 70),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: const Text("Login"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Welcome Section
            const Text(
              "Welcome to your next adventure!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Explore smarter. Travel better.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search destinations, experiences...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.deepOrange),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Banner with Plane
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 130,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background (smaller, behind)
                    ClipRRect(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(100),
                        right: Radius.circular(100),
                      ),
                      child: Image.asset(
                        'images/cloude2.jpg', // Your smaller image
                        width: 250, // Smaller width
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Foreground (larger, in front)
                    ClipRRect(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(100),
                        right: Radius.circular(100),
                      ),
                      child: Image.asset(
                        'images/plane4.png', // Your bigger image
                        width: 550, // Bigger width
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            )


            ,  const SizedBox(height: 30),

            // Categories
            const Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(top: 16.0),

              child: SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildRoundedImageCard("images/Booking.jpg", "Booking"),
                    buildRoundedImageCard("images/exploring.jpg", "Exploring"),
                    buildRoundedImageCard("images/itinarary.jpg", "Itinerary"),
                    buildRoundedImageCard("images/Dining.jpg", "Dining"),
                  ],
                ),

              ),
            ),

            const SizedBox(height: 30),

            // Featured Deals
            const Text(
              "Featured Deals",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            buildActivity("images/activity5.jpg", "Santorini - 30% OFF"),
            buildActivity("images/activity2.jpg", "Tokyo Explorer Tour"),
            buildActivity("images/activity3.jpg", "Morocco Adventure"),
            const SizedBox(height: 30),

            // Activities Section
            const Text(
              "Top Activities",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: 20),

            buildActivity("images/activity1.jpg", "Camel Safari - Dubai"),
            buildActivity("images/activity4.jpg", "Italian Cuisine Tour"),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavIcon(Icons.home_rounded, 0),
            buildNavIcon(Icons.notifications_none_rounded, 1),
            buildNavIcon(Icons.bookmark_border_rounded, 2),
            buildNavIcon(Icons.person_outline_rounded, 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavIcon(IconData icon, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: isSelected ? Colors.deepOrange : Colors.grey[400],
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepOrange,
              ),
            ),
        ],
      ),
    );
  }

  Widget buildRoundedImageCard(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.black.withOpacity(0.6),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildActivity(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              color: Colors.black.withOpacity(0.5),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

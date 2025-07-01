<<<<<<< Updated upstream
import 'package:flutter/material.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:bookify/utils/themes/custom_themes/bookcard.dart';
import 'package:bookify/screens/auth/users/sign_in.dart';


class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
@override
  State<WishlistScreen> createState() => _HomeScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();

  final List<String> categories = [
    'Novels',
    'Self Love',
    'Science',
    'Romance',
    'History',
    'Fantasy',
    'Poetry',
  ];
  // int selectedIndex = 0;
  void navigateToCategory(String title) {
    if (title == 'Novels') {
      Navigator.pushNamed(context, '/novels');
    } else if (title == 'Self Love') {
      Navigator.pushNamed(context, '/self-love');
    } else if (title == 'Science') {
      Navigator.pushNamed(context, '/science');
    } else if (title == 'Romance') {
      Navigator.pushNamed(context, '/romance');
    } else if (title == 'History') {
      Navigator.pushNamed(context, '/history');
    } else if (title == 'Fantasy') {
      Navigator.pushNamed(context, '/fantasy');
    } else if (title == 'Poetry') {
      Navigator.pushNamed(context, '/poetry');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No page found for category: $title")),
      );
    }
  }

=======
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
>>>>>>> Stashed changes
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< Updated upstream
      backgroundColor: MyColors.bg,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Wishlist",
                      style: MyTextTheme.lightTextTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 48), // To balance back button space
                ],
              ),
            ),
            const SizedBox(height: 100),
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () => navigateToCategory(categories[index]),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(129, 178, 223, 219),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Color.fromARGB(129, 178, 223, 219),
                          ),
                        ),
                        child: Text(
                          categories[index],
                          style: const TextStyle(
                            color: MyColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
=======
      backgroundColor: const Color(0xFFeeeeee),
      bottomNavigationBar: buildCurvedNavBar(context, 3),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CustomNavBar(),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.teal,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/thespidy.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Book Title",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: MyColors.primary,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Author Name",
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "\$9.99",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Added to cart"),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.teal.shade100,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.shopping_cart_outlined),
                              ),
                            ),
                            const SizedBox(height: 12),
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Removed from wishlist"),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
>>>>>>> Stashed changes
                    ),
                  );
                },
              ),
            ),
<<<<<<< Updated upstream

            const SizedBox(height: 20),
            SizedBox(
              height: 260,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  BookCard(
                    imagePath: 'assets/images/thespidy.jpg',
                    title: 'Sun Tzu – The Art of War',
                    category: 'Strategic, Fantasy',
                    price: 72,
                    rating: 4.4,
                  ),
                  BookCard(
                    imagePath: 'assets/images/thespidy.jpg',
                    title: 'Atomic Habits',
                    category: 'Self Help',
                    price: 58,
                    rating: 4.7,
                  ),
                ],
              ),
            ),
=======
>>>>>>> Stashed changes
          ],
        ),
      ),
    );
  }
}

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

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    ),
                  );
                },
              ),
            ),

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
          ],
        ),
      ),
    );
  }
}

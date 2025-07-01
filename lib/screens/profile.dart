<<<<<<< Updated upstream
import 'package:flutter/material.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                      "Profile",
                      style: MyTextTheme.lightTextTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 48), // To balance back button space
                ],
              ),
            ),
            // Profile Pic
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: MyColors.primary.withOpacity(0.2),
                  child: Icon(Icons.person, size: 60, color: MyColors.primary),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.primary,
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "Full Name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name is required";
                        } else if (value.length < 3) {
                          return "Name must be of 3 characters";
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Email is required";
                        final emailRegex = RegExp(
                          r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                        );
                        if (!emailRegex.hasMatch(value))
                          return "Enter a valid email address";
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Password",
                        suffixIcon: Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Password is required";
                        final passRegex = RegExp(
                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                        );
                        if (!passRegex.hasMatch(value))
                          return "Password must be 8+ chars w/ upper, lower, digit, special char";
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home),
                        labelText: "Address",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          if (value == null || value.isEmpty)
                            return "Address is required";
                          final addressRegex = RegExp(
                            r"^[A-Za-z0-9\s,.\-\/]{5,}$",
                          );
                          if (!addressRegex.hasMatch(value))
                            return "Enter your valid address";
                          return null;
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: "Phone Number",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Phone number is required";
                        final phoneRegex = RegExp(
                          r"^(?:\+92|0092|92)?3[0-9]{9}$",
                        );
                        if (!phoneRegex.hasMatch(value))
                          return "Enter a valid Pakistani phone number";
                        return null;
                      },
=======
import 'package:bookify/screens/edit_profile.dart';
import 'package:bookify/screens/user_orders.dart';
import 'package:bookify/utils/constants/colors.dart';
import 'package:bookify/utils/themes/custom_themes/app_navbar.dart';
import 'package:bookify/utils/themes/custom_themes/bottomnavbar.dart';
import 'package:bookify/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:bookify/utils/themes/custom_themes/text_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = FirebaseAuth.instance;

  // Dynamic Data from Firestore
  String name = '';
  String email = '';
  String contact = '';
  String address = '';
  String profileImage = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      try {
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .get();
        final data = doc.data();

        if (data != null) {
          setState(() {
            name = data['name'] ?? '';
            email = data['email'] ?? '';
            contact = data['phone'] ?? '';
            address = data['address'] ?? '';
            profileImage = data['profile_image_url'] ?? '';
          });
        }
      } catch (e) {
        print("Error fetching profile: $e");
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      bottomNavigationBar: buildCurvedNavBar(context, 4),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const SizedBox(height: 30),
                  const CustomNavBar(),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserOrders(),
                            ),
                          );
                        },
                        child: Text(
                          "View Orders",
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: Text(
                      "Profile Details",
                      style: MyTextTheme.lightTextTheme.headlineMedium
                          ?.copyWith(color: MyColors.primary),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ClipOval(
                      child: profileImage.isNotEmpty
                          ? Image.network(
                              profileImage,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.person,
                              size: 100,
                              color: Colors.grey,
                            ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  _buildInfoRow("Name:", name),
                  _buildInfoRow("Email:", email),
                  _buildInfoRow("Contact:", contact),
                  _buildInfoRow("Address:", address),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButtonTheme(
                        data: MyElevatedButtonTheme.lightElevatedButtonTheme,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EditProfileScreen(),
                              ),
                            );
                          },
                          child: const Text("Edit Profile"),
                        ),
                      ),
>>>>>>> Stashed changes
                    ),
                  ),
                ],
              ),
<<<<<<< Updated upstream
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: MyElevatedButtonTheme.lightElevatedButtonTheme.style,
                onPressed: () {},
                child: const Text('Save Changes'),
              ),
            ),
          ],
=======
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(158, 205, 249, 239),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: MyColors.primary, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Text(
                label,
                style: MyTextTheme.lightTextTheme.headlineSmall?.copyWith(
                  color: MyColors.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  value,
                  style: MyTextTheme.lightTextTheme.titleMedium?.copyWith(
                    color: Colors.teal,
                  ),
                ),
              ),
            ],
          ),
>>>>>>> Stashed changes
        ),
      ),
    );
  }
}

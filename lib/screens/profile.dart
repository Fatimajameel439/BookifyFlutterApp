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
            CircleAvatar(
              radius: 60,
              backgroundColor: MyColors.primary.withOpacity(0.2),
              child: Icon(Icons.person, size: 60, color: MyColors.primary),
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
                    ),
                  ),
                ],
              ),
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
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_design/core/constant/app_constants.dart';
import 'package:whatsapp_design/shared/ui_components.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<String> languages = [
    'English',
    'Hindi',
    'Punjabi',
    'French',
    'Spanish',
    'German',
  ];

  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                child: ClipOval(
                  child: Image.asset('assets/images/welcome.webp'),
                ),
              ),
              Text(wl, style: mTextStyle35()),
              Text(wl2, style: mTextStyle15()),
              const SizedBox(height: 20),

              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.black, // 👈 Background color of dropdown popup
                ),
                child: DropdownButton<String>(
                  value: selectedLanguage,
                  hint: Text('Choose a language', style: mTextStyle15()),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLanguage = newValue;
                    });
                  },
                  items: languages.map((String lang) {
                    return DropdownMenuItem<String>(
                      value: lang,
                      child: Text(lang,style: mTextStyle15(),),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: selectedLanguage != null
                    ? () {
                  context.go('/signup'); // 👈 Go to your next page
                }
                    : null, // 👈 Disables button when null
                child: const Text('Agree and Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_design/core/shared/app_constants.dart';
import 'package:whatsapp_design/routing/app_router.dart';
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
    //  backgroundColor: Colors.deepPurple,
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
              Text(wl, style: mTextStyle35().copyWith(color: Colors.black87)),
              SizedBox(height: 20,),
              Text(wl2, style: mTextStyle15().copyWith(color: Colors.black87),textAlign: TextAlign.center,),
              const SizedBox(height: 20),

              /*Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.black, // 👈 Background color of dropdown popup
                ),
                child: DropdownButton<String>(
                  value: selectedLanguage,
                  hint: Text('Choose a language', ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLanguage = newValue;
                    });
                  },
                  items: languages.map((String lang) {
                    return DropdownMenuItem<String>(
                      value: lang,
                      child: Text(lang),
                    );
                  }).toList(),
                ),
              ),*/
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:
                    () {
                  context.go(AppRoutes.SIGNUP); // 👈 Go to your next page
                }
                    ,
                child:  Text('Agree and Continue',style: mTextStyle20().copyWith(color: Colors.black54),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


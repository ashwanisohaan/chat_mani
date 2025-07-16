import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_design/core/firebase_operations/firebase_services.dart';
import 'package:whatsapp_design/core/shared/app_constants.dart';
import 'package:whatsapp_design/routing/app_router.dart';
import 'package:whatsapp_design/shared/ui_components.dart';
import 'package:whatsapp_design/shared/utility.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController phController = TextEditingController();
   var loading  = false;

   void setLoading(bool loadState){
     setState(() {
       loading = loadState;
     });
   }


  final List<String> Countries = [
    'India'
  ];

  @override
  Widget build(BuildContext context) {
    String? selectCountry;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(height: 20),
              Text(sgn1, style: mTextStyle20()),
              Text(sgn2, style: mTextStyle15()),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return  Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor:
                          Colors.black, // 👈 Background color of dropdown popup
                    ),
                    child: DropdownButton<String>(
                      value: selectCountry,
                      hint: Text('Select Country', style: mTextStyle15()),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectCountry = newValue;
                        });
                      },
                      items: Countries.map((String lang) {
                        return DropdownMenuItem<String>(
                          value: lang,

                          child: Text(lang, style: mTextStyle15()),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),

              // Text('+91'),
              SizedBox(
                width: 150,
                child: TextField(
                  style: mTextStyle15(),
                  controller: phController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    hint: Text('phone number', style: mTextStyle15()),
                    //border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final mob = "+91${phController.text.toString()}";
                  if (mob.length < 13) {
                    "Please provide valid number!".showAppSnackBar(
                      context,
                      isError: true,
                    );
                  } else {
                    setLoading(true);
                    bool isSaved = await FirestoreServices()
                        .saveUserIfNotExists(mobileNumber: mob);

                    setLoading(true);
                    if (isSaved) {
                      // Todo: Save mobile number in the preference

                      "Login Successfully!".showAppSnackBar(context);
                      context.pushReplacement(AppRoutes.HOME,);
                      context.push(AppRoutes.HOME, extra: mob);
                    } else {
                      "Login failed!".showAppSnackBar(context, isError: true);
                    }
                  }
                },
                child: loading ? CircularProgressIndicator() :Text(
                  'Proceed to login',
                  style: mTextStyle20().copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

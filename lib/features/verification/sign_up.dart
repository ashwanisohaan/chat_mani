import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_design/core/constant/app_constants.dart';
import 'package:whatsapp_design/shared/ui_components.dart';
class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});
   final TextEditingController phController = TextEditingController();
   final List<String> Countries = [
     'India',
     'United States',
     'United Kingdom',
     'Canada',
     'Australia',
     'Germany',
     'France',
     'Italy',
     'Spain',
     'China',
     'Japan',
     'Russia',
     'Brazil',
     'Mexico',
     'South Africa',
     'Pakistan',
     'Bangladesh',
     'Indonesia',
     'Nigeria',
     'Saudi Arabia',
   ];

  @override
  Widget build(BuildContext context) {
    String? selectCountry;
    return  Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(height: 20,),
          Text(sgn1,style: mTextStyle20(),),
          Text(sgn2,style: mTextStyle15(),),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Colors.black, // 👈 Background color of dropdown popup
                      ),
                      child: DropdownButton<String>(
                        value: selectCountry,
                        hint: Text('Select Country',style: mTextStyle15(),),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectCountry = newValue;
                          });
                        },
                        items: Countries.map((String lang) {
                          return DropdownMenuItem<String>(
                            value: lang,

                            child: Text(lang,style: mTextStyle15())

                          );

                        }).toList(),

                      ),
                    );
                  },
                ),
                SizedBox(height: 20,),

               // Text('+91'),

                  SizedBox( width: 150,
                    child: TextField(
                      style: mTextStyle15(),
                      controller: phController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hint: Text('phone number',style: mTextStyle15(),),
                        //border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: phController != null
                      ? () {
                    context.go('/home'); // 👈 Go to your next page
                  }
                      : null, // 👈 Disables button when null
                  child: const Text('next'),
                ),

              ],
              ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



// Future<SharedPreferences> prefInstance() async => await SharedPreferences.getInstance();



SharedPreferences prefInstance(BuildContext context) => Provider.of<SharedPreferences>(context, listen: false);
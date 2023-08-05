import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app_ui/weather_model.dart';

import 'home_screen.dart';

String city = '';

class EnterCityScreen extends StatefulWidget {
   EnterCityScreen({super.key});


  @override
  State<EnterCityScreen> createState() => _EnterCityScreenState();
}

class _EnterCityScreenState extends State<EnterCityScreen> {

  TextEditingController _cityController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/home_screen/img_13.png'),
          fit: BoxFit.fill,
      ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  hintText: 'Enter City',
                  prefixIcon: const Icon(Icons.location_city),
                  enabled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(cityName: _cityController.text,)));

              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                    child: Text(
                      'Enter',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

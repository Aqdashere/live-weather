import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app_ui/enter_City.dart';
import 'package:weather_app_ui/weather_model.dart';

String city = '';

class HomeScreen extends StatefulWidget {

  final String cityName;
  HomeScreen({Key? key, required this.cityName}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  Future<WeatherModel> getWeatherApi() async {
    city = widget.cityName;
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=963a0de25ac14eed88351023232405&q=$city'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(data);
    } else {
      return WeatherModel.fromJson(data);
    }
  }


  List imageList = [
    {"id": 1, "image_path": 'assets/images/home_screen/img_1.png'},
    {"id": 2, "image_path": 'assets/images/home_screen/img_1.png'},
    {"id": 3, "image_path": 'assets/images/home_screen/img_1.png'},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD4D1F0),
      body: SafeArea(
        child:
        FutureBuilder<WeatherModel>(
            future: getWeatherApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.location != null) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EnterCityScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                snapshot.data!.location!.name.toString(),
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Nunito'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 17,),
                    CarouselSlider(
                        items: [
                          Stack(
                            children: [
                              Center(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 14),
                                  width: 242,
                                  height: 295,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          'assets/images/home_screen/img_2.png',
                                        )),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Column(
                                    children: [
                                      const Spacer(),
                                      Image.asset(
                                        'assets/images/home_screen/img.png',
                                        height: 140,
                                        width: 140,
                                      ),
                                      Text('${snapshot.data!.current!.tempC}º',
                                        style: TextStyle(
                                            height: 1.1,
                                            color: Colors.white,
                                            fontSize: 63,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Nunito'),
                                      ),
                                      Text(
                                        snapshot.data!.current!.condition!.text.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Nunito'),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 150,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        DateFormat('yMMMMEEEEd').format(DateTime.now()),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Nunito'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                        carouselController: carouselController,
                        options: CarouselOptions(
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            height: 285,
                            viewportFraction: 0.7, //To show left/right pic
                            autoPlayCurve: Curves.fastOutSlowIn,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            })),
                    const SizedBox(height: 17),
                    const SizedBox(
                      height: 40,
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          height: 315,
                          width: 395,
                          decoration: BoxDecoration(
                            color: const Color(0xff4B3EAE).withOpacity(0.3),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Today',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Next 7 Days',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 35, right: 35),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 142,
                                      width: 92,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                'assets/images/home_screen/img_8.png')),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '6:00 AM',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Image.asset(
                                            'assets/images/home_screen/img_7.png',
                                            height: 60,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '24ºC',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 142,
                                      width: 92,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '6:00 AM',
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Image.asset(
                                            'assets/images/home_screen/img_9.png',
                                            height: 60,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '22ºC',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 142,
                                      width: 92,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '6:00 AM',
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Image.asset(
                                            'assets/images/home_screen/img_10.png',
                                            height: 60,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '18ºC',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 110,
                            width: 345,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 19.0, left: 30, right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/home_screen/img_3.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                      Text(
                                        '${snapshot.data!.current!.humidity.toString()}%',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        'Humidity',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            fontFamily: 'Nunito'),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/home_screen/img_4.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                      Text(
                                        '${snapshot.data!.current!.windKph.toString()}km/h',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      const Text(
                                        'Wind',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            fontFamily: 'Nunito'),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/home_screen/img_5.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                      Text(
                                        snapshot.data!.current!.pressureMb.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      const Text(
                                        'Air Pressure',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            fontFamily: 'Nunito'),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/home_screen/img_6.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                      Text(
                                        '${snapshot.data!.current!.visKm.toString()}km',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      const Text(
                                        'Visibility',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            fontFamily: 'Nunito'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
           //   return Text('no data');
              }
            }),
      ),
    );
  }
}


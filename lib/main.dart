import 'dart:ui';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vyld_assignment/Background/background.dart';
import 'package:vyld_assignment/Background/small_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Muli',
      ),
      title: 'Circle App',
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isVisible = true;

  List<Color> bgColors = const [
    Color(0xfffaa5a3),
    Color(0xff78dfcd),
    Color(0xfffed566),
    Color(0xff72b2ff),
    Color(0xffa7aa8f),
  ];

  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: BackgroundShapes(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _backButton(),
                  _appBar(width),
                  SizedBox(height: height * 0.03),
                  _subHeading(width, height, 'FRIENDS', true),
                  _showFriends(width, height),
                  SizedBox(height: height * 0.02),
                  _subHeading(width, height, 'MEMBER ADDS', true),
                  SizedBox(height: height * 0.02),
                  _showMembers(height, width),
                  SizedBox(height: height * 0.02),
                  _subHeading(width, height, 'CONNECT FOR MORE FRIENDS', false),
                  SizedBox(height: height * 0.02),
                  _links(width, height),
                  SizedBox(height: height * 0.02),
                  _subHeading(width, height, 'ONGOING GAMES', true),
                  _showGames(height, width),
                  _subHeading(width, height, 'SUGGESTED FRIENDS', true),
                  _showSuggetions(height, width),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _showSuggetions(double height, double width) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SizedBox(
            height: height * 0.17,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, index) {
                  return SizedBox(width: width * 0.04);
                },
                itemBuilder: ((context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: bgColors[index],
                            child: Image(
                              image: const AssetImage(
                                  'assets/images/avata_wobg.png'),
                              fit: BoxFit.fill,
                              width: width * 0.18,
                              height: width * 0.18,
                            ),
                          )),
                      Text(
                        'Ramanujan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.035,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(width * 0.002),
                        width: width * 0.15,
                        height: height * 0.03,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 51, 51, 51),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          'Add',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  );
                }))));
  }

  Padding _showGames(double height, double width) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SizedBox(
            height: height * 0.3,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (context, index) {
                  return SizedBox(width: width * 0.05);
                },
                itemBuilder: ((context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: const AssetImage('assets/images/game.jpg'),
                            width: width * 0.36,
                            height: height * 0.22,
                            fit: BoxFit.cover,
                          )),
                      Text(
                        'Game Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: width * 0.037,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: width * 0.05,
                              height: height * 0.025,
                              child: SvgPicture.asset(
                                'assets/svgs/home.svg',
                                color: Colors.grey,
                              )),
                          Text(
                            'Game Location',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: width * 0.035,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }))));
  }

  Padding _links(double width, double height) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _shareButton(width, height, 'assets/svgs/google.svg', Colors.white),
          _shareButton(width, height, 'assets/svgs/facebook.svg',
              const Color(0xff1877ef)),
          _shareButton(
              width, height, 'assets/svgs/insta.svg', const Color(0xffda4271)),
        ],
      ),
    );
  }

  Container _shareButton(
      double width, double height, String svgPath, Color color) {
    return Container(
      padding: EdgeInsets.all(width * 0.03),
      height: height * 0.06,
      width: width * 0.29,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: SvgPicture.asset(
        svgPath,
      ),
    );
  }

  Padding _showMembers(double height, double width) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: height * 0.25,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            separatorBuilder: (context, index) {
              return SizedBox(width: width * 0.05);
            },
            itemBuilder: ((context, index) {
              return Container(
                  width: width * 0.6,
                  decoration: BoxDecoration(
                    color: const Color(0xff2d2b29),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: Image(
                            image: const AssetImage('assets/images/mario.jpg'),
                            height: height * 0.16,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(height: height * 0.01),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.025),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(
                                image: const AssetImage(
                                  'assets/images/coffee.jpg',
                                ),
                                width: width * 0.14,
                                height: width * 0.14,
                              ),
                            ),
                            SizedBox(width: width * 0.02),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Adda Name',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.w600)),
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image(
                                        image: const AssetImage(
                                          'assets/images/avatar_3.png',
                                        ),
                                        width: width * 0.08,
                                        height: width * 0.08,
                                      ),
                                    ),
                                    SizedBox(width: width * 0.015),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image(
                                        image: const AssetImage(
                                          'assets/images/avatar_5.png',
                                        ),
                                        width: width * 0.08,
                                        height: width * 0.08,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.07,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                          width: width * 0.05,
                                          height: height * 0.025,
                                          child: SvgPicture.asset(
                                            'assets/svgs/person.svg',
                                            color: Colors.grey,
                                          )),
                                      SizedBox(width: width * 0.01),
                                      const Text('128',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ));
            })),
      ),
    );
  }

  Padding _showFriends(double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: width,
        height: height * 0.2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                  bottom: width * 0.17,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: const AssetImage('assets/images/avatar_3.png'),
                        fit: BoxFit.fill,
                        width: width * 0.2,
                        height: width * 0.2,
                      )),
                ),
                Positioned(
                  left: width * 0.19,
                  top: width * 0.17,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: const AssetImage('assets/images/avatar_2.jpg'),
                        fit: BoxFit.fill,
                        width: width * 0.2,
                        height: width * 0.2,
                      )),
                ),
                Positioned(
                  bottom: width * 0.17,
                  left: width * 0.39,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: const AssetImage('assets/images/avatar_1.jpg'),
                        fit: BoxFit.fill,
                        width: width * 0.2,
                        height: width * 0.2,
                      )),
                ),
                Positioned(
                  left: width * 0.58,
                  top: width * 0.17,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: const AssetImage('assets/images/avatar_4.png'),
                        fit: BoxFit.fill,
                        width: width * 0.2,
                        height: width * 0.2,
                      )),
                ),
                Positioned(
                  left: width * 0.78,
                  bottom: width * 0.17,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: const AssetImage('assets/images/avatar_5.png'),
                        fit: BoxFit.fill,
                        width: width * 0.2,
                        height: width * 0.2,
                      )),
                ),
              ],
            ),
            const Image(
              image: AssetImage('assets/images/bg_1.png'),
            ),
          ],
        ),
      ),
    );
  }

  Padding _subHeading(
      double width, double height, String heading, bool showExtra) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: TextStyle(color: Colors.grey, fontSize: width * 0.035),
          ),
          showExtra
              ? Container(
                  padding: const EdgeInsets.all(2),
                  width: width * 0.2,
                  height: height * 0.03,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 51, 51, 51),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    'See All',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 116, 116, 116),
                        fontWeight: FontWeight.w600),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Padding _appBar(double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Text('Circle',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: width * 0.1,
                  fontWeight: FontWeight.w700)),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            AnimSearchBar(
              color: const Color(0xff1f1e1e),
              searchIconColor: Colors.white,
              textFieldColor: const Color(0xff1f1e1e),
              textFieldIconColor: Colors.white,
              width: width * 0.8,
              textController: _searchController,
              onSuffixTap: () {},
              onSubmitted: (value) {},
              rtl: true,
            ),
            SizedBox(width: width * 0.01),
            Container(
              padding: EdgeInsets.all(width * 0.02),
              width: width * 0.11,
              height: width * 0.11,
              decoration: BoxDecoration(
                color: Color(0xfffad56a),
                borderRadius: BorderRadius.circular(50),
              ),
              child: SvgPicture.asset('assets/svgs/add.svg'),
            )
          ]),
        ],
      ),
    );
  }

  IconButton _backButton() {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Color(0xffa43e7a),
          size: 30,
        ));
  }
}

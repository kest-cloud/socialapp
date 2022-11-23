import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      title: 'Social App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool statusComment = false;
  bool statusShare = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(Icons.arrow_back_ios, color: Color(0xff8E00FE)),
          title: const Text(
            "Post",
            style: TextStyle(
                color: Color(0xff8E00FE), fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Describe your video here...",
                          style: TextStyle(
                              color: Color(0xffA5A5A5),
                              fontSize: 14,
                              fontFamily: 'Rubik')),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 9.2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TagContainers(
                            title: "Friends",
                            widthsize: 70,
                          ),
                          const SizedBox(width: 20),
                          TagContainers(
                            title: "#Hashtags",
                            widthsize: 85,
                          ),
                          const SizedBox(width: 20),
                          TagContainers(
                            title: "😍",
                            widthsize: 50,
                          ),
                        ],
                      )
                    ],
                  ),
                  Image.asset('images/image.png')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.solidMessage,
                        color: Color(0xff8E00FE),
                        size: 14,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Allow comments",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: "Rubik"),
                      )
                    ],
                  ),
                  FlutterSwitch(
                    activeColor: Color(0xff8E00FE),
                    width: 42.0,
                    height: 23.0,
                    valueFontSize: 10.0,
                    toggleSize: 23.0,
                    value: statusComment,
                    borderRadius: 30.0,
                    onToggle: (val) {
                      setState(() {
                        statusComment = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.share,
                        color: Color(0xff8E00FE),
                        size: 14,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Allow Share",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: "Rubik"),
                      )
                    ],
                  ),
                  FlutterSwitch(
                    activeColor: Color(0xff8E00FE),
                    width: 42.0,
                    height: 23.0,
                    valueFontSize: 10.0,
                    toggleSize: 23.0,
                    value: statusShare,
                    borderRadius: 30.0,
                    onToggle: (val) {
                      setState(() {
                        statusShare = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            SectionthreeSettings(title: "Who can watch this video"),
            const SizedBox(height: 15),
            SectionthreeSettings(title: "Comments Privacy"),
            SizedBox(height: MediaQuery.of(context).size.height / 8),
            InkWell(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height / 17,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xff8E00FE),
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(),
                    Row(
                      children: const [
                        Text(
                          "Post",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          FontAwesomeIcons.share,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(),
                  ],
                )),
              ),
            )
          ],
        ));
  }
}

class SectionthreeSettings extends StatelessWidget {
  String title;
  SectionthreeSettings({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.unlock,
                color: Color(0xff8E00FE),
                size: 14,
              ),
              SizedBox(width: 10),
              Text(
                title,
                style:
                    TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: const [
              Text("Everyone"),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xff7D7D7D),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TagContainers extends StatelessWidget {
  String title;
  double widthsize;
  TagContainers({Key? key, required this.title, required this.widthsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: widthsize,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(4, 1), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xff8E00FE),
            fontFamily: "Rubik",
          ),
        ),
      ),
    );
  }
}

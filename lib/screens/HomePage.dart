import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../components/MaskedImage.dart';
import '../components/SearchField.dart';
import '../constants.dart';
import '../movies/newmoviesdata.dart';
import '../movies/upcomingmoviesdata.dart';
import 'MovieDetail.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: tBlack,
      extendBody: true,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
                top: -100,
                left: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: tGreen.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                )),
            Positioned(
                top: height * 0.4,
                right: -88,
                child: Container(
                  height: 166,
                  width: 166,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: tPink.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 166,
                      width: 166,
                      color: Colors.transparent,
                    ),
                  ),
                )),
            Positioned(
                bottom: -100,
                left: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: tCyan.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                )),
            SafeArea(
                bottom: false,
                child: ListView(
                  primary: true,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "What would you\nlike to watch?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28,
                          color: tWhite,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SearchFieldWidget(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 39,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "New Movies",
                        style: TextStyle(
                          color: tWhite,
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: newMovieImages.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = kMaskFirstIndex;
                          } else if (index == newMovieImages.length) {
                            mask = kMaskLastIndex;
                          } else {
                            mask = kMaskCenter;
                          }
                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 20 : 0,
                              ),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: newMovieImages[index],
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Upcoming Movies",
                        style: TextStyle(
                          color: tWhite,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingMoviesImages.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = kMaskFirstIndex;
                          } else if (index == upcomingMoviesImages.length) {
                            mask = kMaskLastIndex;
                          } else {
                            mask = kMaskCenter;
                          }
                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 20 : 0,
                              ),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: upcomingMoviesImages[index],
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
      
      floatingActionButton: Container(
        height: 74,
        width: 64,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  tPink.withOpacity(0.2),
                  tGreen.withOpacity(0.2),
                ])),
        child: RawMaterialButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MovieDetail()));
          },
          shape: const CircleBorder(),
          fillColor: tBlackishGray,
          child: SvgPicture.asset("images/icons/plus.svg"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
        width: width,
        height: 92,
        borderRadius: 0,
        linearGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              tWhite.withOpacity(0.1),
              tWhite.withOpacity(0.1),
            ]),
        border: 0,
        blur: 30,
        borderGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              tPink,
              tGreen,
            ]),
        child: BottomAppBar(
          color: Colors.transparent,
          notchMargin: 4,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset("images/icons/home.svg"),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("images/icons/watchmore.svg"),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("images/icons/download.svg"),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("images/icons/save.svg"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

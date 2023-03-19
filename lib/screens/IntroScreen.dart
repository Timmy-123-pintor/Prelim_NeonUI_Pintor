import 'dart:ui';
import 'package:flutter/material.dart';
import '../components/CustomOutline.dart';
import '../constants.dart';
import 'HomePage.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

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
                top: height * 0.1,
                left: -88,
                child: Container(
                  height: 166,
                  width: 166,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: tPink,
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
                top: height * 0.3,
                right: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: tGreen,
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
            SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.07,
                ),
                CustomOutline(
                  strokeWidth: 4,
                  radius: width * 0.8,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        tPink,
                        tPink.withOpacity(0),
                        tGreen.withOpacity(0.1),
                        tGreen
                      ],
                      stops: const [
                        0.2,
                        0.4,
                        0.6,
                        1
                      ]),
                  width: 328,
                  height: 328,
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,
                            image: AssetImage(
                                "images/movie promos/introImage.png"))),
                  ),
                ),
                SizedBox(
                  height: height * 0.09,
                ),
                Text(
                  "Watch movies in \nVirtual Reality",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: tWhite.withOpacity(0.85),
                    fontSize: height <= 667 ? 18 : 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: height * 0.09,
                ),
                Text(
                  "Download and watch offline\nwherever you are",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: pinkishWhite.withOpacity(0.75),
                    fontSize: height <= 667 ? 12 : 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomOutline(
                  strokeWidth: 3,
                  radius: 20,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      tPink,
                      tGreen,
                    ],
                  ),
                  width: 160,
                  height: 38,
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          tPink.withOpacity(0.5),
                          tGreen.withOpacity(0.5),
                        ],
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 14,
                            color: tWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Container(
                      height: 7,
                      width: 7,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 0
                              ? tGreen
                              : tWhite.withOpacity(0.2)),
                    );
                  }),
                ),
                SizedBox(
                  height: height * 0.01,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

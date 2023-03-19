// ignore_for_file: file_names, implementation_imports, unused_import, unnecessary_import
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key, required this.padding});

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: tBlack,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            SvgPicture.asset(
              "images/icons/magnifyingglass.svg",
            ),
            const SizedBox(
              width: 8,
            ),
            const Expanded(
              child: TextField(
                style: TextStyle(
                  color: tGray,
                  fontSize: 17,
                  letterSpacing: -0.41,
                ),
                decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: tGray,
                      fontSize: 17,
                      letterSpacing: -0.41,
                    )),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            SvgPicture.asset(
              "images/icons/microphone.svg",
            ),
          ],
        ),
      ),
    );
  }
}

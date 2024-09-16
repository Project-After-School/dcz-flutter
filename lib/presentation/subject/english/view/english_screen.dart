import 'package:dcz/core/dcz.dart';
import 'package:flutter/material.dart';

class EnglishScreen extends StatefulWidget {
  const EnglishScreen({super.key});

  @override
  State<EnglishScreen> createState() => _EnglishScreenState();
}

class _EnglishScreenState extends State<EnglishScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('수학', style: DCZTextStyle.subtitle1(color: DCZColor.white),),
        ListView.builder(
            itemBuilder: (context, index){
              GestureDetector(
                child: Container(
                  height: 76,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('수학 수행평가 안내', style: DCZTextStyle.body2(color: DCZColor.white),),
                          const SizedBox(height: 8),
                          Text('1일 전', style: DCZTextStyle.body3(color: DCZColor.gray200),)
                        ],
                      ),
                      const SizedBox(width: 194),
                      Text('안 읽음', style: DCZTextStyle.body4(color: DCZColor.main500),)
                    ],
                  ),
                ),
              );
            }
        )
      ],
    );
  }
}


import 'package:flutter/material.dart';

class TestPages extends StatefulWidget {
  const TestPages({super.key});

  @override
  State<TestPages> createState() => _TestPagesState();
}

class _TestPagesState extends State<TestPages> {
  String pin = '';

  Widget buildIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: Column(
        children: [
          Icon(
            Icons.security,
            size: 50.0,
          ),
          SizedBox(height: 10.0,),
          Text(
            'PIN LOGIN',
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
          SizedBox(width: 18.0, height: 60.0,),
          Text(
            pin.padRight(6, '_'), // ให้ pin มีขนาดเสมอเท่ากับ 6 ตัว
            style: TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }

  Widget buildNumberButton(int number, String lab) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          handleButtonPress(number);
        },
        child: Column(
          children: [
            Text(
              number.toString(),
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            SizedBox(height: 2.0,),
            Text(lab, style: TextStyle(fontSize: 10.0, color: Colors.black),),
          ],
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          padding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }

  Widget buildIconButton(IconData icon) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          handleButtonPressIcon(icon);
        },
        child: Icon(icon),
      ),
    );
  }

  void handleButtonPress(int number) {
    setState(() {
      if (number == -1 && pin.isNotEmpty) {
        pin = pin.substring(0, pin.length - 1);
      } else if (number != -1 && pin.length < 6) {
        pin += number.toString();
      }
    });
  }

void handleButtonPressIcon(IconData icon) {
  setState(() {
    // Handle different icon button presses
    if (icon == Icons.close) {
      // Handle close icon press
      pin = '';
    } else if (icon == Icons.backspace && pin.isNotEmpty) {
      // Handle backspace icon press
      pin = pin.substring(0, pin.length - 1);
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildIcon(),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildNumberButton(1, 'one'),
                SizedBox(width: 10.0,),
                buildNumberButton(2, 'two'),
                SizedBox(width: 10.0,),
                buildNumberButton(3, 'three'),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildNumberButton(4, 'four'),
                SizedBox(width: 10.0,),
                buildNumberButton(5, 'five'),
                SizedBox(width: 10.0,),
                buildNumberButton(6, 'six'),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildNumberButton(7, 'seven'),
                SizedBox(width: 10.0,),
                buildNumberButton(8, 'eight'),
                SizedBox(width: 10.0,),
                buildNumberButton(9, 'nine'),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildIconButton(Icons.close),
                SizedBox(width: 10.0,),
                buildNumberButton(0, 'zero'),
                SizedBox(width: 10.0,),
                buildIconButton(Icons.backspace),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

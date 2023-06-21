import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../theme/colors.dart';
import '../widgets/clock_view.dart';

class ClockPage extends ConsumerWidget {
  const ClockPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var now = DateTime.now();

    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              // TODO: text_style
              style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700,
                color: CustomColors.primaryTextColor,
                fontSize: 24,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const DigitalClockWidget(),
                Text(
                  formattedDate,
                  // TODO: text_style
                  style: TextStyle(
                    fontFamily: 'avenir',
                    fontWeight: FontWeight.w300,
                    color: CustomColors.primaryTextColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: ClockView(
              size: MediaQuery.of(context).size.height / 5,
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Timezone',
                  // TODO: text_style
                  style: TextStyle(
                    fontFamily: 'avenir',
                    fontWeight: FontWeight.w500,
                    color: CustomColors.primaryTextColor,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.language,
                      color: CustomColors.primaryTextColor,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'UTC$offsetSign$timezoneString',
                      // TODO: text_style
                      style: TextStyle(
                        fontFamily: 'avenir',
                        color: CustomColors.primaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DigitalClockWidget> createState() {
    return DigitalClockWidgetState();
  }
}

class DigitalClockWidgetState extends State<DigitalClockWidget> {
  var formattedTime = DateFormat('HH:mm:ss').format(DateTime.now());
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), updatetimeEveryMin);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  updatetimeEveryMin(Timer timer) {
    setState(() {
      formattedTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formattedTime,
      // TODO: text_style
      style: TextStyle(
        fontFamily: 'avenir',
        color: CustomColors.primaryTextColor,
        fontSize: 64,
      ),
    );
  }
}

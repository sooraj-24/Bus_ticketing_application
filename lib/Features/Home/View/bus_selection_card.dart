import 'package:buts/Features/Home/Controller/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants/constants.dart';

class BusSelectionCard extends StatelessWidget {
  final int index;
  final DateTime startTime;
  final String destination;
  final int capacity;
  const BusSelectionCard({super.key, required this.index, required this.startTime, required this.destination, required this.capacity});
  @override
  Widget build(BuildContext context) {
    var minute = TimeOfDay.fromDateTime(startTime.toLocal()).minute;
    var hour = TimeOfDay.fromDateTime(startTime.toLocal()).hourOfPeriod;
    var period = TimeOfDay.fromDateTime(startTime.toLocal()).period.toString();
    period = period.substring(10).toUpperCase();
    return Consumer<HomePageProvider>(
      builder: (context, controller, child){
        return GestureDetector(
          onTap: (){
            controller.updateSelectCard(index);
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 18),
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 6),
            height: 55,
            decoration: BoxDecoration(
              color: kAccentBlue,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: index == controller.getSelectedIndex ? Border.all(color: kBlue) : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(minute == 0 ? '$hour:${minute}0' : '$hour:$minute',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Inter'
                              ),),
                            const SizedBox(width: 3,),
                            Text(period,
                              style: const TextStyle(
                                  fontSize: 12
                              ),),
                          ],
                        ),
                        const VerticalDivider(
                          thickness: 1.5,
                        ),
                        Text(destination == 'Institute' ? 'Institute' : 'Sadar',
                          style: const TextStyle(
                            fontSize: 15,
                          ),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('$capacity',
                          style: const TextStyle(
                            fontSize: 15,
                          ),),
                        const Text('Seats left',
                          style: TextStyle(
                              fontSize: 10
                          ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
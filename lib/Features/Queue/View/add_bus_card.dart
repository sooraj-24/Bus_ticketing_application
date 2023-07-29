import 'package:flutter/material.dart';

import '../../../Constants/constants.dart';

class AddBusCard extends StatelessWidget {
  const AddBusCard({
  super.key, required this.startTime, required this.destination, required this.onTap, required this.added,
  });

  final DateTime startTime;
  final String destination;
  final VoidCallback onTap;
  final bool added;

  @override
  Widget build(BuildContext context) {
    var minute = TimeOfDay.fromDateTime(startTime.toLocal()).minute;
    var hour = TimeOfDay.fromDateTime(startTime.toLocal()).hourOfPeriod;
    var period = TimeOfDay.fromDateTime(startTime.toLocal()).period.toString();
    period = period.substring(10).toUpperCase();
    return Container(
      height: 80,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(4, 4), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(-4, -4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            decoration: const BoxDecoration(
              color: kYellow,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            ),
          ),
          Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 30),
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '$hour:$minute',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            const SizedBox(width: 3,),
                            Text(
                              period,
                              style: const TextStyle(
                                  fontSize: 14
                              ),
                            ),
                          ],
                        ),
                        Text(
                          destination == 'Insti' ? 'Institute' : destination,
                          style: const TextStyle(
                              fontSize: 14
                          ),
                        ),
                      ],
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: added ? (){} : onTap,
                        child: Ink(
                          height: 35,
                          width: 85,
                          decoration: BoxDecoration(
                            color: added ? kGrey : kBlue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Row(
                            children: [
                              SizedBox(width: 8,),
                              Icon(Icons.add, size: 18, color: kWhite,),
                              SizedBox(width: 10,),
                              Text(
                                'ADD',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: kWhite
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
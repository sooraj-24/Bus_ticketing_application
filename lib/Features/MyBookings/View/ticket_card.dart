import 'package:buts/Features/MyBookings/Controller/bookings_provider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Constants/constants.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
  super.key, required this.startTime, required this.source, required this.destination, required this.isVerified, required this.onTap,
  });
  final DateTime startTime;
  final String source;
  final String destination;
  final bool isVerified;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    List months = ['January', 'February', 'March', 'April', 'May','June','July','Aug','September','October','November','December'];
    var minute = TimeOfDay.fromDateTime(startTime.toLocal()).minute;
    var hour = TimeOfDay.fromDateTime(startTime.toLocal()).hourOfPeriod;
    var period = TimeOfDay.fromDateTime(startTime.toLocal()).period.toString();
    period = period.substring(10).toUpperCase();
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 200,
      decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(3, 3), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(-3, -3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: isVerified ? kGrey : kYellow,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: BoxDecoration(
                        color: isVerified ? kGrey : kYellow,
                        borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                    child: const Text('TODAY',
                      style: TextStyle(
                          color: kBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                      ),),
                  ),
                  const Expanded(child: SizedBox()),
                  Text('${startTime.day}',
                    style: const TextStyle(
                        color: kBlack,
                        fontSize: 42,
                        fontWeight: FontWeight.w600
                    ),),
                  Text('${months[startTime.month-1]}',
                    style: const TextStyle(
                        color: kBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                    ),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Boarding',style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w500
                            ),),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('${hour}:${minute} ${period}',style: TextStyle(
                                fontSize: 17
                            ),)
                          ],
                        ),
                        const SizedBox(width: 30,),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 3, color: Colors.green)),
                            ),
                            const Expanded(
                              child: DottedLine(
                                direction: Axis.vertical,
                                dashColor: Colors.black54,
                                lineThickness: 2,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 3, color: Colors.redAccent)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(source == 'Insti' ? 'Institute' : source,style: TextStyle(fontSize: 15),),
                            const Text('To',style: TextStyle(fontSize: 12),),
                            Text(destination == 'Insti' ? 'Institute' : destination,style: TextStyle(fontSize: 15),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: onTap,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Generate QR',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                ),),
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(Icons.qr_code)
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../../Constants/constants.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    List months = ['January', 'February', 'March', 'April', 'May','June','July','Aug','September','October','November','December'];
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 200,
      decoration: const BoxDecoration(
          color: Color(0xffFAD795),
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                  color: Color(0xff232323),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: const BoxDecoration(
                        color: Color(0xff323232),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: const Text('TODAY',
                      style: TextStyle(
                          color: kWhite,
                          fontSize: 13
                      ),),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(date.day.toString(),
                    style: const TextStyle(
                        color: kWhite,
                        fontSize: 42,
                        fontWeight: FontWeight.w500
                    ),),
                  Text(months[date.month-1],
                    style: const TextStyle(
                        color: kWhite,
                        fontSize: 14
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
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Boarding',style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w500
                            ),),
                            SizedBox(
                              height: 10,
                            ),
                            Text('3:30 PM',style: TextStyle(
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
                                  border: Border.all(width: 3, color: Colors.black54)),
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
                                  border: Border.all(width: 3, color: Colors.black54)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Institute',style: TextStyle(fontSize: 15),),
                            Text('To',style: TextStyle(fontSize: 12),),
                            Text('Sadar',style: TextStyle(fontSize: 15),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
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
                          Icon(Icons.qr_code),
                        ],
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
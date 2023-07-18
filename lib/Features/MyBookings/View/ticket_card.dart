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
              decoration: const BoxDecoration(
                  color: kYellow,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: const BoxDecoration(
                        color: kYellow,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: const Text('TODAY',
                      style: TextStyle(
                          color: kBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                      ),),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(date.day.toString(),
                    style: const TextStyle(
                        color: kBlack,
                        fontSize: 42,
                        fontWeight: FontWeight.w600
                    ),),
                  Text(months[date.month-1],
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){},
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
                                Icon(Icons.qr_code),
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
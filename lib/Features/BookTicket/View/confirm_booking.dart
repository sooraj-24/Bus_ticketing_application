import 'package:buts/Constants/constants.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import '../../../Constants/constants.dart';

class ConfirmBookingPage extends StatelessWidget {
  const ConfirmBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    List months = ['Jan', 'Feb', 'Mar', 'Apr', 'May','Jun','Jul','Aug','Sept','Oct','Nov','Dec'];
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/CityMap.png'),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height*0.2,
              decoration: const BoxDecoration(
                  color: kDarkBlue,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
              ),
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Confirm',
                          style: TextStyle(
                              color: kWhite,
                              fontSize: 30
                          ),
                        ),
                        Text(
                          'Booking',
                          style: TextStyle(
                            color: kWhite,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: kWhite,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.wallet),
                            color: kYellow,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: kWhite,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.person),
                            color: kYellow,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(25),
              height: 250,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
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
              ),
              child: Column(
                children: [
                  Text(
                    'Trip',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Spacer(flex: 1,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 65,
                        child: Text(
                          'Institute',
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3, color: kGrey)),
                      ),
                      Expanded(
                        child: DottedLine(
                          direction: Axis.horizontal,
                          dashColor: kGrey,
                          lineThickness: 2,
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3, color: kGrey)),
                      ),
                      Expanded(
                        child: DottedLine(
                          direction: Axis.horizontal,
                          dashColor: kGrey,
                          lineThickness: 2,
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3, color: kGrey)),
                      ),
                      Expanded(
                        child: DottedLine(
                          direction: Axis.horizontal,
                          dashColor: kGrey,
                          lineThickness: 2,
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3, color: kGrey)),
                      ),
                      SizedBox(
                        width: 65,
                        child: Text(
                          'Sadar',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${months[date.month-1]} ${date.day.toString()}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black45,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              '3:30 PM',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Seats left',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: kAccentBlue,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text(
                              '42',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                              ),
                            ),
                            Text(
                              '₹20',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Spacer(flex: 2,),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){},
                      child: Ink(
                        height: 40,
                        decoration: BoxDecoration(
                          color: kBlue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Proceed to Pay',
                            style: TextStyle(
                                color: kWhite,
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


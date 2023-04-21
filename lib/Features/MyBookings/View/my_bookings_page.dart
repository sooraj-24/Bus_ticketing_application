import 'package:buts/Constants/constants.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class MyBookingsPage extends StatelessWidget {
  const MyBookingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  height: MediaQuery.of(context).size.height*0.27,
                  alignment: Alignment(0,-0.5),
                  decoration: BoxDecoration(
                      color: kDarkBlue,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
                  ),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Book your',
                              style: TextStyle(
                                  color: kWhite,
                                  fontSize: 30
                              ),
                            ),
                            Text(
                              'Next Trip',
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
                                icon: Icon(Icons.wallet),
                                color: kYellow,
                              ),
                            ),
                            SizedBox(width: 10,),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: kWhite,
                              child: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.person),
                                color: kYellow,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 175,
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.05),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(4, 4), // changes position of shadow
                        ),
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.05),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(-4, -4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kBlue,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: Center(child: Text('Book Ticket',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            height: MediaQuery.of(context).size.height*0.66,
            decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(-4, -4), // changes position of shadow
                  ),
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Bookings',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xffFAD795),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Color(0xff232323),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 7),
                                decoration: BoxDecoration(
                                  color: Color(0xff323232),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Text('TODAY',
                                style: TextStyle(
                                  color: kWhite,
                                  fontSize: 13
                                ),),
                              ),
                              Expanded(child: SizedBox()),
                              Text('24',
                              style: TextStyle(
                                color: kWhite,
                                fontSize: 42,
                                fontWeight: FontWeight.w500
                              ),),
                              Text('November',
                              style: TextStyle(
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
                                  padding: const EdgeInsets.only(top: 20,left: 40),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 4),
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(width: 3, color: Colors.black54)),
                                          ),
                                          Expanded(
                                            child: DottedLine(
                                              direction: Axis.vertical,
                                              dashColor: Colors.black54,
                                              lineThickness: 2,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 4),
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(width: 3, color: Colors.black54)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Institute',style: TextStyle(fontSize: 15),),
                                          Text('To',style: TextStyle(fontSize: 12),),
                                          Text('Sadar',style: TextStyle(fontSize: 15),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
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
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Scan Now',style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.w500
                                          ),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Icon(Icons.camera_alt_outlined)
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


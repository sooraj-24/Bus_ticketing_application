import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/MyBookings/View/ticket_card.dart';
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
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  height: MediaQuery.of(context).size.height*0.27,
                  alignment: const Alignment(0,-0.5),
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
                Positioned(
                  top: 175,
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
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
                    child: Container(
                      decoration: const BoxDecoration(
                          color: kBlue,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: const Center(child: Text('Book Ticket',
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
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            height: MediaQuery.of(context).size.height*0.66,
            decoration: BoxDecoration(
                color: kWhite,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(-4, -4), // changes position of shadow
                  ),
                ]
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Bookings',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TicketCard(),
                        TicketCard(),
                        TicketCard()
                      ],
                    ),
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


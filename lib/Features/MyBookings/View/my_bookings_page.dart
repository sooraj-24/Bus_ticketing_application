import 'package:another_flushbar/flushbar.dart';
import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/MyBookings/Controller/bookings_provider.dart';
import 'package:buts/Features/MyBookings/View/ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyBookingsPage extends StatefulWidget {
  const MyBookingsPage({Key? key, required this.token, required this.email}) : super(key: key);
  final String token;
  final String email;
  @override
  State<MyBookingsPage> createState() => _MyBookingsPageState(token: token, email: email);
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  _MyBookingsPageState({required this.token, required this.email});
  final String token;
  final String email;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_)  {
      Provider.of<BookingsProvider>(context,listen: false).getBookings(token);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<BookingsProvider>(
      builder: (context, controller, child){
        return Stack(
          children: [
            Scaffold(
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
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Ink(
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30, right: 30, top: 25),
                          child: Text(
                            'My Bookings',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30, top: 20),
                            child: controller.state == ViewState.Idle
                                ? Center(
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(color: kBlue, strokeWidth: 2,),
                              ),
                            )
                                : ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: controller.bookings.tickets?.length,
                              itemBuilder: (context, index){
                                return TicketCard(
                                  startTime: controller.bookings.tickets![index].startTime!,
                                  source: controller.bookings.tickets![index].source!,
                                  destination: controller.bookings.tickets![index].destination!,
                                  isVerified: controller.bookings.tickets![index].verified!,
                                  onTap: () async {
                                    if(!controller.bookings.tickets![index].verified!){
                                      try {
                                        await controller.getQR(token, controller.bookings.tickets![index].busId!);
                                        print(controller.code);
                                        print(email);
                                        print(controller.bookings.tickets![index].busId);
                                        return showDialog(
                                            context: context,
                                            builder: (BuildContext context){
                                              return Dialog(
                                                insetPadding: EdgeInsets.symmetric(horizontal: 20),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10.0)), //this right here
                                                child: Container(
                                                  height: 400,
                                                  width: double.infinity,
                                                  padding: EdgeInsets.symmetric(horizontal: 27),
                                                  child: QrImageView(
                                                    padding: EdgeInsets.only(top: 27),
                                                    data: "${email} ${controller.code} ${controller.bookings.tickets![index].busId}",
                                                    version: QrVersions.auto,
                                                    // size: 400.0,
                                                  ),
                                                ),
                                              );
                                            }
                                        );
                                      } catch(e) {
                                        Flushbar(
                                          message: e.toString(),
                                          icon: Icon(
                                            Icons.info_outline,
                                            size: 28.0,
                                            color: Colors.blue[300],
                                          ),
                                          duration: const Duration(seconds: 2),
                                          leftBarIndicatorColor: Colors.blue[300],
                                          flushbarPosition: FlushbarPosition.TOP,
                                        ).show(context);
                                      }
                                    } else {
                                      Flushbar(
                                        message: "Ticket already verified!",
                                        icon: Icon(
                                          Icons.info_outline,
                                          size: 28.0,
                                          color: Colors.blue[300],
                                        ),
                                        duration: const Duration(seconds: 2),
                                        leftBarIndicatorColor: Colors.blue[300],
                                        flushbarPosition: FlushbarPosition.TOP,
                                      ).show(context);
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if(controller.state == ViewState.Busy)
              const Opacity(
                opacity: 0.8,
                child: ModalBarrier(dismissible: false, color: Colors.black),
              ),
            if(controller.state == ViewState.Busy)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        );
      },
    );
  }
}


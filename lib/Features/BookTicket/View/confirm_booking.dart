import 'package:another_flushbar/flushbar.dart';
import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/Home/Controller/home_page_provider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<HomePageProvider>(
        builder: (context, controller, child){
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  height: MediaQuery.of(context).size.height*0.2,
                  decoration: BoxDecoration(
                    color: kDarkBlue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(5, 5), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(25)),
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
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(25),
                  height: 250,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(3, 3), // changes position of shadow
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(-3, -3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Trip',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const Spacer(flex: 1,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
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
                          const Expanded(
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
                          const Expanded(
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
                          const Expanded(
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
                          const SizedBox(
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
                      const Spacer(flex: 2,),
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
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                const Text(
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
                              const Text(
                                'Seats left',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                    color: kAccentBlue,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: const Text(
                                  '42',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
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
                      const Spacer(flex: 2,),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            try {
                              if(await controller.bookTicket()){
                                Navigator.pop(context);
                                Flushbar(
                                  message: "Your ticket has been booked",
                                  icon: const Icon(
                                    Icons.info_outline,
                                    size: 28.0,
                                    color: kYellow,
                                  ),
                                  duration: const Duration(seconds: 3),
                                  leftBarIndicatorColor: kYellow,
                                  flushbarPosition: FlushbarPosition.TOP,
                                ).show(context);
                              }
                            } catch (e) {
                              Flushbar(
                                message: e.toString(),
                                icon: const Icon(
                                  Icons.info_outline,
                                  size: 28.0,
                                  color: kYellow,
                                ),
                                duration: const Duration(seconds: 2),
                                leftBarIndicatorColor: kYellow,
                                flushbarPosition: FlushbarPosition.TOP,
                              ).show(context);
                            }
                          },
                          child: Ink(
                            height: 40,
                            decoration: BoxDecoration(
                              color: kBlue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: controller.state == ViewState.Busy
                                  ? const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  color: kWhite,
                                  strokeWidth: 2,
                                ),
                              )
                                  : const Text(
                                'Confirm booking',
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
          );
        },
      ),
    );
  }
}


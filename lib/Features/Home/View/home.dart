import 'package:another_flushbar/flushbar.dart';
import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/BookTicket/View/confirm_booking.dart';
import 'package:buts/Features/Home/Controller/home_page_provider.dart';
import 'package:buts/Features/Home/View/bus_selection_card.dart';
import 'package:buts/Features/MyBookings/View/my_bookings_page.dart';
import 'package:buts/Features/Wallet/View/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.token});
  final String token;
  @override
  State<HomePage> createState() => _HomePageState(token: token);
}

class _HomePageState extends State<HomePage> {
  _HomePageState({required this.token});
  final String token;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_)  {
      Provider.of<HomePageProvider>(context,listen: false).getBuses(token);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentBlue,
      body: Consumer<HomePageProvider>(
        builder: (context, controller, child){
          return Column(
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
                                    onPressed: (){
                                      controller.state = ViewState.Idle;
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return WalletScreen(token: token,);
                                      }));
                                    },
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
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 27,left: 28,right: 28,bottom: 22),
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                      color: kYellow,
                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                  ),
                                  child: Row(
                                    children: controller.getToCity ? [
                                      Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: kWhite,
                                              borderRadius: BorderRadius.all(Radius.circular(30))
                                          ),
                                          child: const Row(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Center(child: Icon(FontAwesome5.city,size: 14,)),
                                              SizedBox(width: 10,),
                                              Center(
                                                child: Text(
                                                  'To City',
                                                  style: TextStyle(
                                                      fontSize: 14
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: (){
                                            controller.getPageController.animateToPage(
                                              1,
                                              duration: const Duration(milliseconds: 300),
                                              curve: Curves.easeInOut,
                                            );
                                          },
                                          icon: const Icon(Maki.college,size: 22,),
                                        ),
                                      ),
                                    ] : [
                                      Expanded(
                                        child: IconButton(
                                          onPressed: (){
                                            controller.getPageController.animateToPage(
                                              0,
                                              duration: const Duration(milliseconds: 300),
                                              curve: Curves.easeInOut,
                                            );
                                          },
                                          icon: const Icon(FontAwesome5.city,size: 14,),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: kWhite,
                                              borderRadius: BorderRadius.all(Radius.circular(30))
                                          ),
                                          child: const Row(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Center(child: Icon(Maki.college,size: 22,)),
                                              SizedBox(width: 10,),
                                              Center(
                                                child: Text(
                                                  'To Institute',
                                                  style: TextStyle(
                                                      fontSize: 14
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //SizedBox(height: 20),
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                child: PageView(
                                  controller: controller.getPageController,
                                  onPageChanged: (index){
                                    controller.toggleToCity();
                                  },
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: controller.state == ViewState.Idle ? const Center(
                                        child: SizedBox(
                                          height: 25, width: 25,
                                            child: CircularProgressIndicator(color: kBlue, strokeWidth: 2,)),
                                      ) : ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: controller.busesToCity.length,
                                        itemBuilder: (context, index){
                                          return BusSelectionCard(
                                            index: index,
                                            startTime: controller.busesToCity[index].startTime!,
                                            destination: controller.busesToCity[index].destination!,
                                            capacity: controller.busesToCity[index].capacity!,
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: controller.state == ViewState.Idle ? const Center(
                                        child: SizedBox(
                                            height: 25, width: 25,
                                            child: CircularProgressIndicator(color: kBlue, strokeWidth: 2,)),
                                      ) : ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: controller.busesToInstitute.length,
                                        itemBuilder: (context, index){
                                          return BusSelectionCard(
                                            index: index,
                                            startTime: controller.busesToInstitute[index].startTime!,
                                            destination: controller.busesToInstitute[index].destination!,
                                            capacity: controller.busesToInstitute[index].capacity!,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //SizedBox(height: 20,),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 26,left: 28,right: 28,top: 22),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: (){
                                      if((controller.getToCity == true && controller.getSelectedIndex >= 0 &&
                                          controller.getSelectedIndex < controller.busesToCity.length) || (controller.getToCity == false &&
                                      controller.getSelectedIndex >= 0 && controller.getSelectedIndex < controller.busesToInstitute.length)){
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return ConfirmBookingPage(token: token,);
                                        }));
                                      } else {
                                        Flushbar(
                                          message: "Please select a bus",
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
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 40, right: 40),
                height: MediaQuery.of(context).size.height*0.1,
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
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MyBookingsPage(token: token);
                    }));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Bookings',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: kBlack,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      )
    );
  }
}



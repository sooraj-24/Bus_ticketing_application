import 'dart:convert';

import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/Home/Controller/home_page_provider.dart';
import 'package:buts/Features/MyBookings/View/ticket_card.dart';
import 'package:buts/Features/Wallet/Controller/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  State<WalletScreen> createState() => _WalletScreenState(token: token);
}

class _WalletScreenState extends State<WalletScreen> {
  _WalletScreenState({required this.token});
  final String token;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_)  async {
      await Provider.of<HomePageProvider>(context,listen: false).getWallet(token, false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, controller, child){
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
                                  'My',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontSize: 30
                                  ),
                                ),
                                Text(
                                  'WALLET',
                                  style: TextStyle(
                                    color: kWhite,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Your balance',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                controller.state == ViewState.Idle
                                ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(
                                        color: kBlack,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  ),
                                )
                                    : Text(
                                  '₹${controller.walletDetails.wallet}.00',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                    color: kYellow,
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 28,
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
                height: MediaQuery.of(context).size.height*0.56,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
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
                    const Text(
                      'Transaction history',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Divider(thickness: 1,),
                    Expanded(
                      child: controller.state == ViewState.Idle
                          ? Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2,),
                        ),
                      )
                          : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.walletDetails.transactions!.length + 1,
                        itemBuilder: (context, index){
                          if(index ==  controller.walletDetails.transactions?.length){
                            return Center(
                              child: InkWell(
                                onTap: () async {
                                  controller.showMoreTransactions();
                                  await controller.getWallet(token, true);
                                },
                                child: Container(
                                  height: 27,
                                  width: 85,
                                  decoration: BoxDecoration(
                                      color: kAccentBlue,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: controller.state == ViewState.Busy
                                      ? Center(
                                        child: SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: CircularProgressIndicator(strokeWidth: 1, color: kBlue,),
                                  ),
                                      )
                                      : Center(
                                        child: Text(
                                    'Show more',
                                    style: TextStyle(
                                          color: kBlue,
                                      fontSize: 13
                                    ),
                                  ),
                                      ),
                                ),
                              ),
                            );
                          }
                          List months = ['January', 'February', 'March', 'April', 'May','June','July','Aug','September','October','November','December'];
                          DateTime? dateTime = controller.walletDetails.transactions?[index].date;
                          var minute = TimeOfDay.fromDateTime(dateTime!.toLocal()).minute;
                          var hour = TimeOfDay.fromDateTime(dateTime.toLocal()).hourOfPeriod;
                          var period = TimeOfDay.fromDateTime(dateTime.toLocal()).period.toString();
                          period = period.substring(10).toUpperCase();
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Booked ticket',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '${months[dateTime.month-1]} ${dateTime.day}, ${dateTime.year} at ${hour}:${minute} ${period}',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black54
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '-₹20',
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


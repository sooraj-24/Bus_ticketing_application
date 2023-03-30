import 'package:buts/Constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/maki_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController();
  bool toCity = true;
  int selectedIndex = -1;

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
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
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
                    //padding: EdgeInsets.all(25),
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
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25,left: 25,right: 25,bottom: 20),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: kYellow,
                                borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              child: Row(
                                children: toCity ? [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: kWhite,
                                          borderRadius: BorderRadius.all(Radius.circular(30))
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Center(child: Icon(FontAwesome5.city,size: 15,)),
                                          SizedBox(width: 10,),
                                          Center(
                                            child: Text(
                                              'To City',
                                              style: TextStyle(
                                                  fontSize: 15
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
                                        pageController.animateToPage(
                                          1,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      icon: Icon(Maki.college,size: 22,),
                                    ),
                                  ),
                                ] : [
                                  Expanded(
                                    child: IconButton(
                                      onPressed: (){
                                        pageController.animateToPage(
                                          0,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      icon: Icon(FontAwesome5.city,size: 15,),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: kWhite,
                                          borderRadius: BorderRadius.all(Radius.circular(30))
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Center(child: Icon(Maki.college,size: 22,)),
                                          SizedBox(width: 10,),
                                          Center(
                                            child: Text(
                                              'To Institute',
                                              style: TextStyle(
                                                  fontSize: 15
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
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: PageView(
                              controller: pageController,
                              onPageChanged: (index){
                                setState(() {
                                  toCity = !toCity;
                                });
                              },
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: List.generate(6, (index){
                                        return BusSelectionCard(onPressed: (){
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                          isSelected: index == selectedIndex ? false : true,);
                                      }),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: List.generate(6, (index){
                                        return BusSelectionCard(onPressed: (){
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                          isSelected: index == selectedIndex ? false : true,);
                                      }),
                                    ),
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
                            padding: const EdgeInsets.only(bottom: 25,left: 25,right: 25,top: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: kBlue,
                                borderRadius: BorderRadius.all(Radius.circular(20))
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
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
            height: MediaQuery.of(context).size.height*0.1,
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
            child: Text(
              'My Bookings',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      )
    );
  }
}

class BusSelectionCard extends StatefulWidget {
  BusSelectionCard({required this.isSelected,required this.onPressed});
  final void Function() onPressed;
  final bool isSelected;
  @override
  _BusSelectionCardState createState() => _BusSelectionCardState(onPressed: onPressed, isSelected: isSelected);
}

class _BusSelectionCardState extends State<BusSelectionCard> {

  _BusSelectionCardState({required this.isSelected,required this.onPressed});
  final void Function() onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
        height: 55,
        decoration: BoxDecoration(
          color: kAccentBlue,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: isSelected ? Border.all(color: kBlue) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('3:30',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter'
                    ),),
                  SizedBox(width: 3,),
                  Text('PM',
                    style: TextStyle(
                        fontSize: 12
                    ),),
                ],
              ),
            ),
            VerticalDivider(
              thickness: 1.5,
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  SizedBox(width: 33,),
                  Text('Sadar',
                    style: TextStyle(
                      fontSize: 16,
                    ),),
                  Expanded(child: SizedBox()),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('48',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                        ),),
                      Text('Seats left',
                        style: TextStyle(
                            fontSize: 12
                        ),)
                    ],
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


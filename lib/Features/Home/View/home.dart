import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/Home/Controller/home_page_provider.dart';
import 'package:buts/Features/SignIn/Controller/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late IO.Socket socket;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomePageProvider>(context,listen: false).updateBusCards();
    });
    Provider.of<HomePageProvider>(context,listen: false).initSocket(Provider.of<SignInProvider>(context,listen: false).user.data?.token);
    super.initState();
  }

  // initSocket() {
  //   socket = IO.io('https://buts-server.onrender.com/', <String, dynamic>{
  //     'autoConnect': true,
  //     'transports': ['websocket'],
  //     'extraHeaders': { 'Authorization' : Provider.of<SignInProvider>(context,listen: false).user.data?.token }
  //   });
  //   socket.connect();
  //   socket.onConnect((_) {
  //     print('Connection established');
  //   });
  //   socket.onDisconnect((_) => print('Connection Disconnection'));
  //   socket.onConnectError((err) => print(err));
  //   socket.onError((err) => print(err));
  //
  //   socket.on('Connection_Success', (data){
  //     print(data);
  //   });
  //   socket.on('Connection_Error', (data){
  //     print(data);
  //   });
  // }

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
                                padding: const EdgeInsets.only(top: 27,left: 28,right: 28,bottom: 22),
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: kYellow,
                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                  ),
                                  child: Row(
                                    children: controller.getToCity ? [
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
                                              duration: Duration(milliseconds: 300),
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
                                            controller.getPageController.animateToPage(
                                              0,
                                              duration: Duration(milliseconds: 300),
                                              curve: Curves.easeInOut,
                                            );
                                          },
                                          icon: Icon(FontAwesome5.city,size: 14,),
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
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: controller.getBusCards,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: controller.getBusCards,
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
                                padding: const EdgeInsets.only(bottom: 26,left: 28,right: 28,top: 22),
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
          );
        },
      )
    );
  }

  @override
  void dispose() {
    socket.disconnect();
    socket.dispose();
    super.dispose();
  }
}



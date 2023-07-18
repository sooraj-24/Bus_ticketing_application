import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/Home/Controller/home_page_provider.dart';
import 'package:buts/Features/Queue/Controller/queue_provider.dart';
import 'package:buts/Features/SignIn/Controller/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:buts/Features/Queue/Controller/queue_provider.dart';
import 'add_bus_card.dart';

class QueueScreen extends StatelessWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kAccentBlue,
        body: Consumer<QueueProvider>(
          builder: (context, controller, child){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
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
                                    'Get in',
                                    style: TextStyle(
                                        color: kWhite,
                                        fontSize: 30
                                    ),
                                  ),
                                  Text(
                                    'QUEUE',
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
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Preference',
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              ),
                              Divider(thickness: 1,),
                              Expanded(
                                child: ReorderableListView.builder(
                                  padding: EdgeInsets.zero,
                                  onReorder: (oldIndex, newIndex){
                                    print("reordering");
                                    controller.updatePreference(oldIndex, newIndex);
                                    print(controller.buses);
                                  },
                                  itemCount: controller.buses.length,
                                  itemBuilder: (context, index){
                                    return Padding(
                                      key: ValueKey(controller.buses[index]),
                                      padding: const EdgeInsets.only(bottom: 8, top: 8),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            child: Icon(Icons.remove_circle_outline, size: 16, color: Colors.black45,),
                                            onTap: (){
                                              print(index);
                                              print(controller.buses);
                                              controller.removeBus(index);
                                            },
                                          ),
                                          SizedBox(width: 6,),
                                          Text(
                                            controller.buses[index],
                                            style: TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                          Expanded(child: SizedBox(), flex: 5,),
                                          Text(
                                            'Sadar',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          Expanded(child: SizedBox(), flex: 8,),
                                          Icon(Icons.reorder, size: 20, color: Colors.black45,),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 5,),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: (){},
                                  child: Ink(
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: kBlue,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Get in Queue',
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
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AddBusCard(),
                        AddBusCard(),
                        AddBusCard(),
                        AddBusCard(),
                        AddBusCard()
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



import 'package:another_flushbar/flushbar.dart';
import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/Queue/Controller/queue_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Home/Model/bus_model.dart';
import 'add_bus_card.dart';

class QueueScreen extends StatelessWidget {
  const QueueScreen({super.key, required this.buses, required this.token});
  final List<Bus> buses;
  final String token;
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
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Preference',
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              ),
                              const Divider(thickness: 1,),
                              Expanded(
                                child: ReorderableListView.builder(
                                  padding: EdgeInsets.zero,
                                  onReorder: (oldIndex, newIndex){
                                    controller.updatePreference(oldIndex, newIndex);
                                  },
                                  itemCount: controller.preferenceList.length,
                                  itemBuilder: (context, index){
                                    return Padding(
                                      key: ValueKey(controller.preferenceList[index]),
                                      padding: const EdgeInsets.only(bottom: 8, top: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 80,
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  child: const Icon(Icons.remove_circle_outline, size: 16, color: Colors.black45,),
                                                  onTap: (){
                                                    controller.removeBus(index);
                                                  },
                                                ),
                                                const SizedBox(width: 6,),
                                                Text(
                                                  '${TimeOfDay.fromDateTime(controller.preferenceList[index].startTime!.toLocal()).hourOfPeriod}:${TimeOfDay.fromDateTime(controller.preferenceList[index].startTime!.toLocal()).minute} ${TimeOfDay.fromDateTime(controller.preferenceList[index].startTime!.toLocal()).period.toString().substring(10).toUpperCase()}',
                                                  style: const TextStyle(
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            controller.preferenceList[index].destination! == 'Insti' ? 'Institute' : 'Sadar',
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            width: 80,
                                              child: const Icon(Icons.reorder, size: 20, color: Colors.black45,)
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () async {
                                    if(!controller.inQueue){
                                      try {
                                        await controller.getInQueue(token);
                                        if(controller.inQueue){
                                          Flushbar(
                                            message: "You're in Queue",
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
                                    }
                                  },
                                  child: Ink(
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: controller.inQueue ? kGrey : kBlue,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: controller.state == ViewState.Busy
                                          ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(color: kWhite, strokeWidth: 2,),
                                      )
                                          : const Text(
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
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: buses.length,
                    itemBuilder: (context, index){
                      return AddBusCard(
                        startTime: buses[index].startTime!,
                        destination: buses[index].destination!,
                        added: controller.preferenceList.contains(buses[index]),
                        onTap: (){
                          controller.addBus(buses[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        )
    );
  }
}



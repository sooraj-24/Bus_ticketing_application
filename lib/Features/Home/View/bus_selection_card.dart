import 'package:buts/Features/Home/Controller/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants/constants.dart';

class BusSelectionCard extends StatelessWidget {
  final int index;

  const BusSelectionCard({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, controller, child){
        return GestureDetector(
          onTap: (){
            controller.updateSelectCard(index);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 18),
            padding: EdgeInsets.symmetric(horizontal: 18,vertical: 12),
            height: 55,
            decoration: BoxDecoration(
              color: kAccentBlue,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: index == controller.getSelectedIndex ? Border.all(color: kBlue) : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('3:30',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter'
                            ),),
                          SizedBox(width: 3,),
                          Text('PM',
                            style: TextStyle(
                                fontSize: 12
                            ),),
                        ],
                      ),
                      VerticalDivider(
                        thickness: 1.5,
                      ),
                      Text('Sadar',
                        style: TextStyle(
                          fontSize: 15,
                        ),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('48',
                          style: TextStyle(
                            fontSize: 13,
                          ),),
                        Text('Seats left',
                          style: TextStyle(
                              fontSize: 8
                          ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
import 'package:facebook_app/HomePage.dart';
import 'package:facebook_app/Models/Sidepanels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class responsive extends StatefulWidget {
  @override
  _responsiveState createState() => _responsiveState();
}

class _responsiveState extends State<responsive> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isDesktop(context)) {
          return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            LeftSidePanel(screen),
              Container(
                  width: screen.width * 0.4,
                  color: Color(0xFFf0f2f5),
                  child: homepage(0.4)),
              RightSidePanel(screen)
            ],
          );
        } else {
          return homepage(1);
        }
        //...returns a widget
      },
    );
  }

  Container RightSidePanel(Size screen) {
    return Container(
              width: screen.width * 0.25,
              color: Color(0xFFf0f2f5),
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Contacts",
                            style: TextStyle(color: Color(0xFF74767a),fontStyle: FontStyle.normal,fontSize: 19),
                          ),
                          Row(
                            children: [
                              Icon(Icons.video_call_outlined,
                                  color:  Color(0xFF606770) ,size: 26,),
                              SizedBox(width: 15.0),
                              Icon(Icons.search, color:  Color(0xFF606770),size: 26),
                              SizedBox(width: 15.0),
                              Icon(Icons.format_list_bulleted, color:  Color(0xFF606770),size:26)
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 14,),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: contacts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TextButton(
                          onPressed: () {  },
                          child: Container(
                            height: 50.0,
                            width: screen.width * 0.25,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 7.0,
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(contacts[index].img),
                                  maxRadius: 20.0,
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  contacts[index].title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
  }

  Container LeftSidePanel(Size screen) {
    return Container(
              width: screen.width * 0.25,
              color: Color(0xFFf0f2f5),
              child: ListView.builder(
                itemCount: sidepanel1.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50.0,
                    width: screen.width * 0.25,
                    child: TextButton(
                      onPressed: () {  },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 7.0,
                          ),
                          index != 0
                              ? Icon(
                                  sidepanel1[index].iconData,
                                  color: Color(0xFF1c8af6),
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      AssetImage(sidepanel1[index].img),
                                  maxRadius: 20.0,
                                ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(sidepanel1[index].title,
                              style:  TextStyle(
                                letterSpacing: 0.65,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ,fontStyle: FontStyle.normal)),
                          SizedBox(height: 5.0)
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
  }
}

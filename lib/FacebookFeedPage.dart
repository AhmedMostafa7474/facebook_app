import 'package:facebook_app/Responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:facebook_app/HomePage.dart';

class facebookfeed extends StatefulWidget {
  @override
  _facebookfeedState createState() => _facebookfeedState();
}

class _facebookfeedState extends State<facebookfeed> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 1,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Color(0xFFf0f2f5),
        appBar: PreferredSize(
          preferredSize: Size(screen.width,isDesktop(context)?60:100),
          child: Center(
            child: !isDesktop(context)? AppBarMobile(screen, context):AppbarDesktop(screen),
          )
        ),
        body: TabBarView(children: [
          responsive(),
        ]),
      )
    );
  }

  AppBar AppbarDesktop(Size screen) {
    return AppBar(
            backgroundColor: CupertinoColors.white,
            leadingWidth: 0.5,
            title:
            Container(
              padding: EdgeInsets.all(8.0),
              width: screen.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          "assets/facebookLogo.png",
                        ),
                        maxRadius: 20,
                      ),
                      SizedBox(width: 15.0,),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Color(0xFFf0f2f5),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),bottomLeft:Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            border: Border.all(color:Colors.transparent)
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Search Facebook",
                            prefixIcon: Icon(Icons.search)
                            ,
                          ),
                        ),
                      ),
                      SizedBox(width: 34.0,),
                      Container(
                        height: 60,
                        width: screen.width*0.5,
                        child: TabBar(
                          controller: _tabController,
                          indicatorColor: Colors.blue,
                          tabs: [
                            Tab(
                                icon: Icon(
                                    Icons.home,
                                    size: 29
                                )),
                            Tab(icon: Icon(Icons.group,size: 29)),
                            Tab(icon: Icon(Icons.subscriptions_outlined,size: 29,)),
                            Tab(icon: Icon(Icons.notifications,size: 29,)),
                            Tab(icon: Icon(Icons.format_list_bulleted,))
                          ],
                          labelColor: CupertinoColors.activeBlue,
                          unselectedLabelColor: CupertinoColors.systemGrey,
                        ),
                      ),

                    ],

                  ),
    MediaQuery.of(context).size.width >= 1170? Row(
                    children: [
                      InkWell(
                        onTap: () {  },
                        child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            minRadius: 18,
                            child: Icon(
                              Icons.list_alt,
                              color: Colors.black,
                              size: 24,
                            )),
                      ),
                      SizedBox(width: 12,),
                      InkWell(
                        onTap: () {  },
                        child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            minRadius: 18,
                            child: Icon(
                              FontAwesomeIcons.facebookMessenger,
                              color: Colors.black,
                              size: 20,
                            )),
                      ),
                      SizedBox(width: 12,),
                      InkWell(
                        onTap:() {  },
                        child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            minRadius: 18,
                            child: Icon(
                              Icons.notifications,
                              color: Colors.black,
                              size: 24,
                            )),
                      ),
                      SizedBox(width: 12,),
                      InkWell(
                        onTap: () {  },
                        child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            minRadius: 18,
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                              size: 28,
                            )),
                      ),
                      SizedBox(width: 12,),
                    ],
                  ):SizedBox(height: 0,width: 0,),
                ],

              ),
            ),
          );
  }

  AppBar AppBarMobile(Size screen, BuildContext context) {
    return AppBar(
            titleSpacing: -2,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/logo-fb.png",
                  height: 50,
                  width: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          minRadius: 18,
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 24,
                          )),
                      SizedBox(
                        width: 12,
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          minRadius: 18,
                          child: Icon(
                            FontAwesomeIcons.facebookMessenger,
                            color: Colors.black,
                            size: 24,
                          )),
                    ],
                  ),
                )
              ],
            ),
            flexibleSpace: Center(
              child: Container(
                padding: EdgeInsets.only(top:screen.height*0.095),
                width: isDesktop(context)?screen.width*0.5:screen.width,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.blue,
                  tabs: [
                    Tab(
                        icon: Icon(
                      Icons.home,
                            size: 29
                    )),
                    Tab(icon: Icon(Icons.group,size: 29)),
                    Tab(icon: Icon(Icons.subscriptions_outlined,size: 29,)),
                    Tab(icon: Icon(Icons.notifications,size: 29,)),
                    Tab(icon: Icon(Icons.format_list_bulleted,))
                  ],
                  labelColor: CupertinoColors.activeBlue,
                  unselectedLabelColor: CupertinoColors.systemGrey,
                ),
              ),
            ),
            backgroundColor: CupertinoColors.white,
          );
  }
}

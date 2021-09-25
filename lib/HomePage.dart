import 'package:carousel_slider/carousel_slider.dart';
import 'package:facebook_app/Models/Sidepanels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'Controllers/PostsController.dart';
import 'Models/Stories.dart';

class homepage extends StatefulWidget {
  double websize;

  homepage(this.websize);

  @override
  _homepageState createState() => _homepageState(websize);
}

class _homepageState extends State<homepage> {
  var posttextcontrol = TextEditingController();
  var commenttextcontrol = TextEditingController();
  postController _controller = Get.put(postController());
  double websize;
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;
  _homepageState(this.websize);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            isDesktop(context)?StoriesSection():PostSection(screen),
            Divider(
              height: 5.0,
              color: Colors.grey,
            ),
           isDesktop(context)? SizedBox(
              height: 8,
              child: Container(
                color: Colors.grey[300],
              ),
            ):SizedBox(),
            isDesktop(context)?PostSection(screen):tabBarSection(screen),
            Divider(
              color: Colors.grey[600],
              height: 2.0,
            ),
           isDesktop(context)?SizedBox():SizedBox(
              height: 8,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            isDesktop(context)?tabBarSection(screen):Room_Contacts_Section(),
            Divider(
              color: Colors.grey[600],
              height: 2.0,
            ),
            SizedBox(
              height: 8,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            isDesktop(context)?Room_Contacts_Section():StoriesSection(),
            Divider(
              color: Colors.grey[600],
              height: 2.0,
            ),
            SizedBox(
              height: 8,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Obx(
              () => ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _controller.Posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: screen.width * websize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12),
                        Row(
                          children: [
                            SizedBox(
                              width: 8.0,
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  _controller.Posts[index].userphoto),
                              maxRadius: 22,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _controller.Posts[index].username,
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      _controller.Posts[index].time + " .",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Icon(
                                      Icons.vpn_lock,
                                      color: Colors.grey,
                                      size: 15.0,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_controller.Posts[index].Text,),
                        ),
                        _controller.Posts[index].imgs.isNotEmpty
                            ? (_controller.Posts[index].imgs.length < 2
                                ? Image.asset(
                                    _controller.Posts[index].imgs[0],
                                    height: isDesktop(context)?320:220,
                                    width: screen.width * websize,
                                    fit: BoxFit.fill,
                                  )
                                : ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    children: [
                                      CarouselSlider.builder(
                                        itemCount: _controller
                                            .Posts[index].imgs.length,
                                        options: CarouselOptions(
                                            height:isDesktop(context)?320: 200,
                                            enlargeCenterPage: true,
                                            autoPlay: true,
                                            enableInfiniteScroll: true),
                                        itemBuilder:
                                            (BuildContext context, int index2) {
                                          return Container(
                                            margin: EdgeInsets.all(6.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              image: DecorationImage(
                                                image: AssetImage(_controller
                                                    .Posts[index].imgs[index2]),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ))
                            : SizedBox(
                                height: 0.0,
                              ),
                        Divider(
                          color: Colors.grey[500],
                          height: 2.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Tab(
                              child: InkWell(
                                onTap: () {
                                  _controller.pressLike(index);
                                },
                                child: Obx(
                                  () => Container(
                                    width: screen.width * 0.25 * websize,
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.heart,
                                            color:!_controller.likes[index]
                                                    ? Colors.grey[600]
                                                    : Colors.blue,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "Like",
                                            style: TextStyle(
                                                color: !_controller.likes[index]
                                                    ? Colors.grey[600]
                                                    : Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: InkWell(
                                onTap: () {
                                  CommentsPress(index, screen);
                                },
                                child: Container(
                                  width: screen.width * 0.25 * websize,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.comment,
                                          color: CupertinoColors.systemGrey,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Comment",
                                          style: TextStyle(
                                              color: Colors.grey[600]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TabTile(
                                screen,
                                CupertinoIcons.arrowshape_turn_up_right,
                                CupertinoColors.systemGrey,
                                "Share"),
                          ],
                        ),
                        Divider(
                          color: Colors.grey[600],
                          height: 2.0,
                        ),
                        SizedBox(
                          height: 8,
                          child: Container(
                            color: Colors.grey[300],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox StoriesSection() {
    return SizedBox(
      height: isDesktop(context)?400*websize:200,
      child: ListView.builder(
              shrinkWrap: true,
              itemCount: Stories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      height: 400*websize,
                      width: 150,
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(Stories[index].StoryPhoto),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: Colors.blue,width: 2.5)
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(Stories[index].userPhoto),
                        maxRadius: 16,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
    );
  }

  Column Room_Contacts_Section() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Audio and Video Rooms",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 40.0,
                        width: 120,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Create Room",
                            style:
                                TextStyle(color: CupertinoColors.activeBlue),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFFd8f0ef)),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      SizedBox(
                        width: 200,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 9,
                            mainAxisSpacing: 4,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return CircleAvatar(
                              backgroundImage:
                                  AssetImage(contacts[index].img),
                              maxRadius: 16,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
  }

  Row tabBarSection(Size screen) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TabTile(screen, Icons.live_tv, CupertinoColors.systemRed, "Live"),
      TabTile(screen, Icons.photo_library_outlined, CupertinoColors.activeGreen,
          "Photo"),
      TabTile(screen, Icons.video_call_outlined, CupertinoColors.systemPurple,
          "Room"),
    ]);
  }

  Row PostSection(Size screen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/UserProfile.jpeg"),
          maxRadius: 25,
        ),
        SizedBox(
          width: 5.0,
        ),
        TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  PostPress(screen);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30.0),
                          right: Radius.circular(30.0))),
                  height: 40.0,
                  width: 250.0,
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "What's on your mind?",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            ))
      ],
    );
  }

  void PostPress(Size screen) {
    Get.defaultDialog(
      title: "",
      content: Container(
        height: 300,
        width: 300,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                }),
            title: Center(
              child: Text(
                "Create Post",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 7,
                        controller: posttextcontrol,
                        decoration: InputDecoration(
                          hintText: "What's on your mind?",
                          hintStyle:
                              TextStyle(color: Colors.black54, fontSize: 22),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Center(
                          child: Container(
                        width: screen.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(40.0),
                                right: Radius.circular(40.0))),
                        child: TextButton(
                          onPressed: () {
                            _controller.AddPost(posttextcontrol.text);
                            Get.back();
                          },
                          child: Center(
                              child: Text(
                            "Post",
                            style: TextStyle(color: Colors.white),
                          )),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue),
                        ),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void CommentsPress(int index, Size screen) {
    Get.bottomSheet(
      SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Center(
              child: Text(
                "Comments",
                style: TextStyle(fontSize: 22, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            _controller.Posts[index].commentss.isNotEmpty
                ? Obx(
                    () => ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _controller.Posts[index].commentss.length,
                      itemBuilder: (BuildContext context, int index2) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                              width: screen.width * 0.8,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 12),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                _controller
                                                    .Posts[index]
                                                    .commentss[index2]
                                                    .userphoto),
                                            maxRadius: 22,
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _controller.Posts[index]
                                                    .commentss[index2].username,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(_controller.Posts[index]
                                            .commentss[index2].Text),
                                      ),
                                      _controller.Posts[index].commentss[index2]
                                              .img.isNotEmpty
                                          ? Image.asset(
                                              _controller.Posts[index].imgs[0],
                                              height: 220,
                                              width: screen.width,
                                            )
                                          : SizedBox()
                                    ]),
                              )),
                        );
                      },
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.comment,
                            size: 50,
                          ),
                          Text(
                            "No Comments Yet",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: screen.width * 0.6,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      controller: commenttextcontrol,
                      decoration: InputDecoration(
                          hintText: "Write comment...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      _controller.AddComment(commenttextcontrol.text, index);
                      commenttextcontrol.clear();
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      //isScrollControlled: true,
      backgroundColor: Colors.white,
    );
  }

  TextButton TabTile(Size screen, IconData Iconn, Color colorr, String title) {
    return TextButton(
      onPressed: () {  },
      child: Tab(
        child: Container(
          width: screen.width * 0.25 * websize,
          child: Center(
            child: Row(
              children: [
                Icon(
                  Iconn,
                  color: colorr,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.grey[600]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

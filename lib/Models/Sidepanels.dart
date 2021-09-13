import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class item{
  String title;

  item(this.title, this.iconData, this.img);

  IconData iconData;
  String img;
}
List<item>sidepanel1=[
  item("Ahmed Mostafa", Icons.verified_user, "assets/UserProfile.jpeg"),
  item("Friends", Icons.group_sharp, ""),
  item("Groups", Icons.group_work, ""),
  item("Memories", Icons.update, ""),
  item("MarketPlace", Icons.shopping_cart_outlined, ""),
  item("Watch", Icons.subscriptions, ""),
  item("See More", Icons.arrow_drop_down_circle_outlined, ""),
];
List<item>contacts=[
  item("Chris Jack", Icons.verified_user,  "assets/UserProfile2.jpg"),
  item("Leo Paul", Icons.verified_user,  "assets/UserProfile5.jpg",),
  item( "Angel",Icons.verified_user, "assets/UserProfile4.jpg"),
  item( "Karry William", Icons.verified_user,"assets/UserProfile3.jpg"),
  item("Chris Jack", Icons.verified_user,  "assets/UserProfile2.jpg"),
  item("Leo Paul", Icons.verified_user,  "assets/UserProfile5.jpg",),
  item( "Angel",Icons.verified_user, "assets/UserProfile4.jpg"),
  item( "Karry William", Icons.verified_user,"assets/UserProfile3.jpg"),
  item("Chris Jack", Icons.verified_user,  "assets/UserProfile2.jpg"),
  item("Leo Paul", Icons.verified_user,  "assets/UserProfile5.jpg",),
  item( "Angel",Icons.verified_user, "assets/UserProfile4.jpg"),
  item( "Karry William", Icons.verified_user,"assets/UserProfile3.jpg"),
] ;
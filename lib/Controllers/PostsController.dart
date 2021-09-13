
import 'package:facebook_app/Models/Comments.dart';
import 'package:facebook_app/Models/Post.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class postController extends GetxController
{
  List<post>Posts=[
    post("Ahmed Mostafa", "assets/UserProfile.jpeg", "1h", "It was a great day , hope to try it again", ["assets/Party.jpg"], [
      comments("Chris Jack", "assets/UserProfile2.jpg", "Grateful to met you", "")
    ],false),
    post("Chris Jack", "assets/UserProfile2.jpg", "2h", "Today Its Gym Day !", ["assets/BackDay.jpg"], [],false),
    post("Leo Paul", "assets/UserProfile5.jpg", "3h", "Good Morning", [], [],false),
    post("Angel", "assets/UserProfile4.jpg", "4h", "Fantasy Football is back for the new season 🙌 💶 How will you spend your €100M? ", [], [],false),
    post("Karry William", "assets/UserProfile3.jpg", "4h", "Studying Mood", ["assets/studying1.jpg","assets/studying2.jpg"], [],false),
  ].obs;

  AddPost(String text)
  {
    post p=post("Ahmed Mostafa", "assets/UserProfile.jpeg", "1 m", text, [], [],false);
    Posts.insert(0,p);

  }
  AddComment(String text,int index)
  {
    comments c=comments("Ahmed Mostafa", "assets/UserProfile.jpeg", text, "");
    Posts[index].commentss.add(c);
  }
  List<bool> likes = List.filled(20,false).obs;
  pressLike(index)
  {
    likes[index] = !likes[index];
  }
}
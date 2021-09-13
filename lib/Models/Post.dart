import 'package:facebook_app/Models/Comments.dart';

class post
{
  String username;
  String userphoto;
  String time;
  String Text;
  List<String> imgs;
  List<comments>commentss;
  bool like;
  post(this.username, this.userphoto, this.time, this.Text, this.imgs,this.commentss,this.like);

}

import 'package:flutter/material.dart';
import 'package:tiktok/classes/tiktok.dart';
import 'package:tiktok/widget/leftItems.dart';
import 'package:tiktok/widget/rightItems.dart';
import 'package:tiktok/widget/videoPlayer.dart';

class TikTokVideo extends StatelessWidget {
  final ItemListData data;

  const TikTokVideo({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          TikTokVideoPlayer(url: data.itemInfos.video.urls[0]),
          title(),
          RightItems(
            comments: data.itemInfos.commentCount.toString(),
            userImg: data.authorInfos.covers[0],
            favorite: data.itemInfos.diggCount,
            coverImg: data.musicInfos.covers[0],
          ),
          LeftItems(
            description: data.itemInfos.text,
            musicName: data.musicInfos.musicName,
            authorName: data.musicInfos.authorName,
            userName: data.authorInfos.uniqueId,
          )
        ],
      ),
    );
  }

  Widget title() => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 28.0),
          child: Text(
            "Trending | For You",
            style: TextStyle(color: Colors.white, fontSize: 19.0),
          ),
        ),
      );
}

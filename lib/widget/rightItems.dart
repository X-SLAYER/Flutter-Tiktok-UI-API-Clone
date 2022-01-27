import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_formatter/money_formatter.dart';

class RightItems extends StatelessWidget {
  final int? favorite;
  final String? comments;
  final String? userImg;
  final String? coverImg;

  const RightItems({
    Key? key,
    this.favorite,
    this.comments,
    this.userImg,
    this.coverImg,
  });

  @override
  Widget build(BuildContext context) {
    MoneyFormatter fmf =
        MoneyFormatter(amount: double.parse(favorite.toString()));
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          userLogo(),
          SizedBox(height: 12.0),
          customIcon(Icons.favorite, "${fmf.output.compactNonSymbol}"),
          customIcon(Icons.insert_comment, comments!),
          customIcon(FontAwesomeIcons.share, "Share"),
          SizedBox(height: 40.0),
          musicLogo(),
        ],
      ),
    );
  }

  Widget userLogo() {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(userImg!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget customIcon(IconData ico, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(ico, color: Colors.white, size: 40.0),
        SizedBox(height: 5.0),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 10.0)
      ],
    );
  }

  Widget musicLogo() {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: AvatarGlow(
        glowColor: Colors.black,
        endRadius: 35.0,
        child: Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(coverImg!), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

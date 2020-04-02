import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RightItems extends StatelessWidget {
  final int favorite;
  final String comments;
  final String userImg;
  final String coverImg;

  const RightItems(
      {Key key, this.favorite, this.comments, this.userImg, this.coverImg});

  @override
  Widget build(BuildContext context) {
    FlutterMoneyFormatter fmf =
        FlutterMoneyFormatter(amount: double.parse(favorite.toString()));
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          userLogo(),
          SizedBox(height: 12.0),
          customIcon(Icons.favorite, "${fmf.output.compactNonSymbol}"),
          customIcon(Icons.insert_comment, comments),
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
          image: NetworkImage(userImg),
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
        endRadius:
            35.0, //required https://i.iheart.com/v3/url/aHR0cDovL2ltYWdlLmloZWFydC5jb20vaW1hZ2VzL3JvdmkvNTAwLzAwMDQvMzUxL01JMDAwNDM1MTA4My5qcGc=?ops=fit%28480%2C480%29%2Crun%28%22circle%22%29&surrogate=1cOXl179JY-syhxYSCX6Q1a_Mcu6UO8d-F4oJzpZf1hcUbJr4aImwtcKGFetygNPKx2a2jKgDrRWeMd-3Y81NovggdU4GlcP6b4Kjc0ypRaOcQif4FwzHlTRUwRp6VeSlYfxISS4xMP-jvp1KPWT2FvXla9vg4B6K11C6Dso-zOhrMh7m6gRl6duI1b1Qv28_7GjnisZPeXTWEhbp5WVkXItCQ%3D%3D'
        child: Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(coverImg), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vita/pages/profile/profile_info.dart';
import 'package:vita/assets/theme/theme.dart';


class ProfileHeader extends StatelessWidget {

  Profile profile;

  ProfileHeader(this.profile);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double headerHeight = height/2;
    TextStyle mainTextStyle = new TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 35.0);
    TextStyle subTextStyle = new TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.w700);

    return new Container(
      height: headerHeight,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  height: headerHeight*(1/2),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: profile.image, fit: BoxFit.scaleDown),
                  ),
                ),
                new Container (
                  height: headerHeight*(1/3),
                  decoration: new BoxDecoration(
                    color: ThemeColors.grey1,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                profile.fullName,
                                style: mainTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Center(
                              child: Text(
                                profile.location,
                                style: subTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

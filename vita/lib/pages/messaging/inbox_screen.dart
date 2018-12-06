import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import './contact_button.dart';
//import '../../assets/constants/contacts.dart';
import 'package:vita/pages/profile/profile_info.dart';
//import './data_share_timeperiod.dart';
import './data_share_sent.dart';



class InboxScreen extends StatefulWidget {
  InboxScreen();

  @override
  _InboxScreen createState() => new _InboxScreen();
}

class _InboxScreen extends State<InboxScreen> {
  List<Contact> all_contacts = <Contact>[];
  List<bool> all_checks = <bool>[];
  List<String> all_names = <String>[];

  Profile profile = getProfile();

  callback(newCheckVal, childTitle) {
    for(int i = 0; i < profile.contacts_names.length; i++) {
      if (all_names[i] == childTitle) {
        setState(() {
          all_checks[i] = newCheckVal;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    if(all_contacts.length == 0) {
      for(int i = 0; i < profile.contacts_names.length; i++) {
        all_checks.add(false);
        all_contacts.add(Contact(name: profile.contacts_names[i], email: profile.contacts_emails[i], img: profile.contacts_images[i], checkValue:all_checks[i], callBack: callback));
        all_names.add(profile.contacts_names[i]);
      };
    }

    List<Widget> scroll_children = [];
    List<bool> scroll_children_checkValue = [];
    List<String> scroll_children_name = [];

    scroll_children.add(
      Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.08,
          margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.all(5.0),
          child: FlatButton(
            child: Text("My Contacts", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, color: ThemeColors.lightGreen) ),
          )
      ),
    );

    scroll_children.add(
      Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.08,
          margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.all(5.0),

          child: FlatButton(
            child: Text("UPMC Care Team", ),

          )
      ),
    );

    for(int i = 0; i < 2 ; i++) {
      scroll_children.add(all_contacts[i]);
      scroll_children_checkValue.add(all_checks[i]);
      scroll_children_name.add(profile.contacts_names[i]);
    }

    scroll_children.add(
      Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.08,
          margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.all(5.0),
          child: FlatButton(
            child: Text("Family & Friends"),
          )
      ),
    );

    for (int i =2; i < all_contacts.length; i++) {
      scroll_children.add(all_contacts[i]);
      scroll_children_checkValue.add(all_checks[i]);
      scroll_children_name.add(profile.contacts_names[i]);
    }

    scroll_children.add(
      Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.08,
          margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.all(5.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            color: ThemeColors.orange,
          ),
          child: FlatButton(
            child: Text("Share my data!"),
            //TODO make onPressed go to a screen with a share link
            onPressed: () {
            //  print(scroll_children_name.toString());
            //  print(all_checks.toString());
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => data_share_sent()),
              );
              //Navigator.maybePop(context);
            },
          ),
      ),
    );

    return new Scaffold(
      body: ListView.builder(
        itemBuilder: ((context, int i) => (scroll_children[i])),
        itemCount: scroll_children.length,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
      ),
    );
  }
}

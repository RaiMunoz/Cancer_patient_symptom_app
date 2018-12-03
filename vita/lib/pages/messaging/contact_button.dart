import 'package:flutter/material.dart';
import '../../assets/theme/theme.dart';

//final List<Widget> contacts = <Widget>[
  //Contact(name:'Dr. Carissa Low', email: 'drlow@upmc.edu', img: 'assets/images/low.jpeg', pressed:false),
  //Contact(name:'Dr. Bahary', email: 'drbahary@upmc.edu', img: 'assets/images/bahary.png', pressed:false),
  //Contact(name:'Devon Barry', email: 'devonb@andrew.cmu.edu', img: 'assets/images/devon.jpg', pressed:false),
  //Contact(name:'Laura Bressler', email: 'lbressle@andrew.cmu.edu', img: 'assets/images/laura.jpg', pressed:false),
  //Contact(name:'Jocelyn Chan', email: 'jchan@andrew.cmu.edu', img: 'assets/images/jocelyn.jpg', pressed:false),
  //Contact(name:'Erin Fuller', email: 'efuller@andrew.cmu.edu', img: 'assets/images/erin.jpg', pressed:false),
  //Contact(name:'Vikram Kamath', email: 'vkamath@andrew.cmu.edu', img: 'assets/images/vikram.jpg', pressed:false),
  //Contact(name:'Rai Munoz', email: 'rmunoz@andrew.cmu.edu', img: 'assets/images/rai.jpg', pressed:false),
  //Contact(name:'Lizzy Thrasher', email: 'lthrasher@andrew.cmu.edu', img: 'assets/images/lizzy.jpg', pressed:false),
  //Contact(name:'Anurati Sodani', email: 'asodani@andrew.cmu.edu', img: 'assets/images/anurati.jpg', pressed:false),
  //Contact(name: 'Click to share your data!', email:'', img:'', pressed:false),
//];
// HILLMAN CENTER CARE TEAM TEXT BOX
// DOCTOR CONTACTS
// hard code new instances of doctor contacts for now but eventually get them from the questionnaire
// FAMILY AND FRIENDS TEXT BOX
// FAMILY CONTACTS
// ADD CONTACT BUTTON
// ADDS TO LIST OF TOTAL CONTACTS
// SHARE BUTTON
// LOOP THROUGH CONTACTS AND IF CONTACT.CHECKED IS TRUE, ADD TO CONTACT LIST
// IF NO CONTACTS CHECKED, DON'T DO ANYTHING

class Contact extends StatefulWidget {
  final String name;
  final String email;
  final String img;
  //final bool pressed;
  bool checkValue;
  Function(bool,String) callBack;

  //operator [](widget.pressed) => false&widget.pressed; // get
  //operator []=(bool pressed) => false; // set

  Contact({Key key, this.name, this.email, this.img, this.checkValue, this.callBack}): super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _ContactState();
  }
}

class _ContactState extends State<Contact>{
  @override
  Widget build(BuildContext context) {
    //Color button_color = Colors.red[200];
    //bool pressed = widget.pressed;
    double width = MediaQuery.of(context).size.width;
    // row with three children: photo, text and selection box
    // text is a column with two children: name and email
    return Container(
      margin: EdgeInsets.all(width * 0.01),
      padding: const EdgeInsets.all(8.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: ThemeColors.lightGreen,
      ),
      alignment: Alignment.center,
      child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              // PHOTO
                Container(
                  padding: const EdgeInsets.only(left:50.0, right:30.0, top:30.0, bottom:30.0),
                  //width: 50.0,
                  //height: 50.0,
                    //TODO make the images all square
                    decoration: new BoxDecoration(
                      image: new DecorationImage(image: AssetImage(widget.img), fit: BoxFit.scaleDown),
                    ),
                ),
              // TEXT
                Expanded(
                  //width: 195.0,
                  //padding: const EdgeInsets.all(10.0),
                  child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NAME
                        Text(widget.name,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        // EMAIL
                        Text(widget.email,
                          style: TextStyle(fontSize: 11.0),
                        ),
                      ],
                    ),
                ),
              // SELECT BOX
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Checkbox(
                    value: widget.checkValue,
                    onChanged: (bool value) {
                      setState(() {
                        widget.checkValue = value;
                        widget.callBack(widget.checkValue, widget.name);
                      });
                    },
                  ),
                ),
              ),

              ]
          ),
    );

  }
  void color_change(Color color){
    if (color == ThemeColors.lightGreen){
      color =  ThemeColors.grey3;
    }
    else{
      color = ThemeColors.lightGreen;
    }
  }
  bool press(bool pressed) {
    if (pressed) {
      pressed = false;
    }
    else{
      pressed = true;
    }
  }
}

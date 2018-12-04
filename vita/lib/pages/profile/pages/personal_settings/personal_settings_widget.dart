import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import 'package:vita/pages/profile/profile_info.dart';

// Inspired from https://github.com/tomialagbe/flutter_ui_challenges
class _personalSettings extends State<personalSettings> {
  static Profile profile = getProfile();
  final nameController = TextEditingController.fromValue(new TextEditingValue(text:profile.fullName));
  final locationController = TextEditingController.fromValue(new TextEditingValue(text:profile.location));
  final weightController = TextEditingController.fromValue(new TextEditingValue(text:profile.weight.toString()));

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.darkGreen,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: ThemeColors.white),
          onPressed: () {
            profile.firstName = nameController.text.split(" ")[0];
            if (nameController.text.split(" ").length >1){
              profile.lastName = nameController.text.split(" ")[1];
            }
            else {
              profile.lastName = "";
            }
            profile.location = locationController.text;
            profile.weight = double.parse(weightController.text);
            Navigator.pop(context);
            },
        ),
        title: Text('Personal Settings'),
      ),
      body: Container(
        color: ThemeColors.grey2,
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          padding: const EdgeInsets.only(left: 5.0),
          children: <Widget>[
            _settingItem("Name", profile.fullName, TextInputType.text, nameController),
            _settingItem("Location", profile.location, TextInputType.text, locationController),
            _settingItem("Weight", profile.weight.toString(), TextInputType.number, weightController),
          ],
        ),
      ),
    );
  }

}
class personalSettings extends StatefulWidget {
  @override
  _personalSettings createState() => _personalSettings();
}

Widget _settingItem(String title, String initialValue, TextInputType keyboard, TextEditingController controller) {
  final titleTextStyle = new TextStyle(
      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600);

  final textboxTextStyle = new TextStyle(
      color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600);

  return Padding(padding: new EdgeInsets.all(10.0),
      child: Container(
      height: 120.0,
      padding: const EdgeInsets.all(10.0),
      decoration: new BoxDecoration (
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          color: ThemeColors.grey4
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: titleTextStyle),
            Container(
              decoration: new BoxDecoration (
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  color: Colors.white
              ),
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                  keyboardType: keyboard,
                  maxLength: 20,
                  //initialValue: initialValue,
                  style: textboxTextStyle,
                  controller: controller,
              ),
            ),
          ],
      ),
    ),
  );
}
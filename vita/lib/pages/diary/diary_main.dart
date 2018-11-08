import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'diary_entry.dart';
import 'contact_service.dart';


// Inspired from https://codingwithjoe.com/building-forms-with-flutter/
class diary_main extends StatefulWidget {
  diary_main({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _diary_main createState() => new _diary_main();
}

class _diary_main extends State<diary_main> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', 'Great', 'Good', 'No Change', 'Awful'];
  String _color = '';
  diary_entry newDiaryEntry = new diary_entry();
  final TextEditingController _controller = new TextEditingController();

  Future<Null> _chooseDate(
      BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  bool isValidDob(String dob) {
    if (dob.isEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
  }

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return regex.hasMatch(input);
  }

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event

      print('Form save called, newContact is now up to date...');
      //print('Email: ${newContact.name}');
      print('Date: ${newDiaryEntry.dob}');
      print('Medication: ${newDiaryEntry.medication}');
      print('Symptom: , ${newDiaryEntry.symptom}');
      print('Feedback: ${newDiaryEntry.feedback}');
      print('Favorite Color: ${newDiaryEntry.rating}');
      print('========================================');
      print('Submitting to back end...');
      var contactService = new ContactService();
      contactService.createDiaryentry(newDiaryEntry).then((value) =>
          showMessage(
              'New Diary Entry created for ${value.medication}!', Colors.blue));
    }
  }

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        key: _scaffoldKey,
        body: new SafeArea(
            top: false,
            bottom: false,
            child: new Form(
                key: _formKey,
                autovalidate: true,
                child: new ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter Diary Entry Title',
                        labelText: 'EntryTitle',
                      ),
                      inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                      validator: (val) => val.isEmpty ? 'Name is required' : null,
                      onSaved: (val) => newDiaryEntry.entry_title = val,
                    ),
                    new Row(children: <Widget>[
                      new Expanded(
                          child: new TextFormField(
                            decoration: new InputDecoration(
                              icon: const Icon(Icons.calendar_today),
                              hintText: 'Enter todays date',
                              labelText: 'Dob',
                            ),
                            controller: _controller,
                            keyboardType: TextInputType.datetime,
                            validator: (val) =>
                            isValidDob(val) ? null : 'Not a valid date',
                            onSaved: (val) => newDiaryEntry.dob = convertToDate(val),
                          )),
                      new IconButton(
                        icon: new Icon(Icons.more_horiz),
                        tooltip: 'Choose date',
                        onPressed: (() {
                          _chooseDate(context, _controller.text);
                        }),
                      )
                    ]),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.content_paste),
                        hintText: 'Enter Medication (otherwise N/A)',
                        labelText: 'Medication',
                      ),
                      //keyboardType: TextInputType.phone,
                      inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                      validator: (val) => val.isEmpty ? 'Medication' : null,
                      onSaved: (val) => newDiaryEntry.medication = val,
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.description),
                        hintText: 'Symptom',
                        labelText: 'Symptom',
                      ),
                      //keyboardType: TextInputType.emailAddress,
                      inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                      validator: (val) => val.isEmpty ? 'Symptom' : null,
                      onSaved: (val) => newDiaryEntry.symptom = val,
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.edit),
                        hintText: 'feedback',
                        labelText: 'feedback',
                      ),
                      //keyboardType: TextInputType.emailAddress,
                      inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                      validator: (val) => val.isEmpty ? 'feedback' : null,
                      onSaved: (val) => newDiaryEntry.feedback = val,
                    ),
                    new FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.star),
                            hintText: 'Rating',
                            labelText: 'Rating',
                          ),
                          isEmpty: _color == '',
                          child: new DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                              value: _color,
                              isDense: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  newDiaryEntry.rating = newValue;
                                  _color = newValue;
                                  state.didChange(newValue);
                                });
                              },
                              items: _colors.map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                      validator: (val) {
                        return val != '' ? null : 'Please select a rating';
                      },
                    ),
                    new Container(
                        padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                        child: new RaisedButton(
                          child: const Text('Submit'),
                          onPressed: _submitForm,
                        )),
                  ],
                ))),
      );
    }
  }

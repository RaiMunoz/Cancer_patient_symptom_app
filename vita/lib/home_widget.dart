import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'add_diary_entry_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class HighlightReminder extends StatelessWidget {
  final Widget icon;
  final String text;

  HighlightReminder(this.icon, this.text);

  @override
  Widget build(context) {
    return Padding(
      child: RaisedButton.icon(
        icon: icon,
        label: Text(text),
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        disabledColor: Colors.blueGrey[400],
        disabledTextColor: Colors.white,
        onPressed: null,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.0),
    );
  }
}

class DiaryButton extends StatelessWidget {
  final String title;
  final VoidCallback action;

  DiaryButton(this.title, this.action);

  @override
  Widget build(context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 15.0),
        height: 80.0,
        child: RaisedButton(
          child: Text(title,
            //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.5),
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
          color: Colors.teal[600],
          elevation: 6.0,
          onPressed: action,
        )
    );
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    PlaceholderWidget(Colors.deepOrange),
    AddInformation(),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.purple),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle:true,
          title: Text('Vita'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
          )
        ]
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            title: new Text('Diary'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_circle_outline),
            title: new Text('Add'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.insert_chart),
            title: new Text('Analytics'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.message),
            title: new Text('Message'),
            backgroundColor: Colors.blue,
          )
        ],
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey[300],

      body: Column (
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Vita',
              style: TextStyle(
                fontSize: 60.0,
                color: Colors.lightBlue[400],
                fontFamily: 'Lucida Calligraphy',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
                'Hi Beth.\nCheck out some highlights.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  HighlightReminder(Icon(Icons.directions_run), 'Walked 5 miles'),
                  HighlightReminder(Icon(Icons.restaurant), 'Cooked a meal'),
                  HighlightReminder(Icon(Icons.local_florist), 'Went to the park'),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.0),
            child: Text(
              'Some Reminders!',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  HighlightReminder(Icon(Icons.priority_high), 'Take Cytoxan'),
                  HighlightReminder(Icon(Icons.phone), 'Call Dr. Hilton'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      color: Colors.teal[200],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DiaryButton('Symptoms', (){Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddSymptomsWidget()),
                );
                },),

                DiaryButton('Medications', (){Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddMedicationsWidget()),
                );}),

                DiaryButton('Nutrition', () {}),

                DiaryButton('Activity', () {}),

                DiaryButton('Sleep', (){Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddSleepWidget()),
                );}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'add_diary_entry_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
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
        title: Text('Vita'),
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
    return Container (
      color: Colors.grey[300],
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 55.0),
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
            padding: EdgeInsets.only(top: 55.0),
            child: Text(
                'Hi Beth.\nCheck out some highlights.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding( // start highlights
            padding: EdgeInsets.only(top: 20.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    child: RaisedButton.icon(
                      icon: Icon(Icons.directions_run),
                      label: Text('Walked 5 miles'),
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      disabledColor: Colors.blueGrey[400],
                      disabledTextColor: Colors.white,
                      onPressed: null,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  Padding(
                    child: RaisedButton.icon(
                      icon: Icon(Icons.restaurant),
                      label: Text('Cooked a meal'),
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      disabledColor: Colors.blueGrey[400],
                      disabledTextColor: Colors.white,
                      onPressed: null,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  Padding(
                    child: RaisedButton.icon(
                      icon: Icon(Icons.local_florist),
                      label: Text('Went to the park'),
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      disabledColor: Colors.blueGrey[400],
                      disabledTextColor: Colors.white,
                      onPressed: null,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                ],
              ),
            ),
          ), // end highlights
          Padding(
            padding: EdgeInsets.only(top: 35.0),
            child: Text(
              'Some Reminders!',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding( // start reminders
            padding: EdgeInsets.only(top: 20.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    child: RaisedButton.icon(
                      icon: Icon(Icons.priority_high),
                      label: Text('Take Cytoxan'),
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      disabledColor: Colors.blueGrey[400],
                      disabledTextColor: Colors.white,
                      onPressed: null,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  Padding(
                    child: RaisedButton.icon(
                      icon: Icon(Icons.phone),
                      label: Text('Call Dr. Hilton'),
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      disabledColor: Colors.blueGrey[400],
                      disabledTextColor: Colors.white,
                      onPressed: null,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                ],
              ),
            ),
          ), // end reminders
        ],
      ),
    );
  }
}

class AddInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: RaisedButton(
                      child: Text("Symptoms",
                          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.5)
                      ),
                      color: Colors.lightBlue[400],
                      onPressed: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => AddSymptomsWidget()),
                      );
                      },
                    )
                ),
                Container(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: RaisedButton(
                      child: Text("Medications",
                          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.5)
                      ),
                      color: Colors.lightBlue[400],
                      onPressed: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => AddMedicationsWidget()),
                      );}
                    )
                ),
                Container(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: RaisedButton(
                      child: Text("Nutrition",
                          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.5)
                      ),
                      color: Colors.lightBlue[400],
                      onPressed: (){},
                    )
                ),
                Container(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: RaisedButton(
                      child: Text("Activity",
                          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.5)
                      ),
                      color: Colors.lightBlue[400],
                      onPressed: (){},
                    )
                ),
                Container(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: RaisedButton(
                      child: Text("Sleep",
                          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.5)
                      ),
                      color: Colors.lightBlue[400],
                      onPressed: (){Navigator.push(
                        context, MaterialPageRoute(builder: (context) => AddSleepWidget()),
                      );}
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
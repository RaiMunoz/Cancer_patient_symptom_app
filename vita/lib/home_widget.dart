import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'add_diary_entry_widget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
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
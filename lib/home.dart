import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /*
   pluto : 0.06
   mars  : 0.38
   venus : 0.91
   */

  final TextEditingController _weightController = TextEditingController();
  var _finalResult = 0.0;
  var _formattedText;
  int radioValue = 0;

  handledRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });

    switch(radioValue) {
      case 0 :
        _finalResult = calculateWeight(_weightController.text, 0.06);
        _formattedText = "Berat kamu di pluto adalah ${_finalResult.toStringAsFixed(1)}";
        break;
      case 1 :
        _finalResult = calculateWeight(_weightController.text, 0.38);
        _formattedText = "Berat kamu di Mars adalah ${_finalResult.toStringAsFixed(1)}";
        break;
      case 2 :
        _finalResult = calculateWeight(_weightController.text, 0.91);
        _formattedText = "Berat kamu di Venus adalah ${_finalResult.toStringAsFixed(1)}";
        break;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Berat di planet X"),
          centerTitle: true,
          backgroundColor: Colors.black87),

      body: Padding(
        padding: const EdgeInsets.only(top:40.0),
        child: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom:40.0),
                child: Image.asset("img/1.jpg", width: 200, height: 133),
              ),

              // Text input
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.only(left:12.0),
                          child: TextField(
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Berat kamu dibumi",
                                hintText: "Dalam pounds",
                                icon: Icon(Icons.person),
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //3 radio button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<int>(
                      activeColor: Colors.brown,
                      value: 0, groupValue: radioValue, onChanged: handledRadioValueChanged),
                  Text('Pluto',style: TextStyle(color: Colors.lightBlue)),

                  Radio<int>(
                      activeColor: Colors.red,
                      value: 1, groupValue: radioValue, onChanged: handledRadioValueChanged),
                  Text('Mars',style: TextStyle(color: Colors.lightBlue)),

                  Radio<int>(
                      activeColor: Colors.amber,
                      value: 2, groupValue: radioValue, onChanged: handledRadioValueChanged),
                  Text('Venus',style: TextStyle(color: Colors.lightBlue))
                ],
              ),

              //Hasil
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(_weightController.text.isEmpty ? "Masukkan berat badan kamu" : _formattedText + " lbs",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {

    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) >0) {
      return int.parse(weight) * multiplier;
    } else {

      print('Wrong !!');
      return int.parse("180") * 0.38;
    }

  }
} //TODO : digunakan untuk membuat tampilan konversi berat badan di palanet lain dengan menampilkan gambar, radio button, teks.
class tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.android)),
                Tab(icon: Icon(Icons.assessment)),
                Tab(icon: Icon(Icons.build)),
              ],
            ),
            title: Text('Rute'),
          ),
          body: TabBarView(
            children: [
              Home(),
              SnackBarPage(),
              list(),

            ],
          ),
          drawer: drawer(),
        ),
      ),
    );
  }
  @override
  Widget drawer() {
    return Scaffold(
      body: tab(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("img/planet.png", width: 50, height: 50),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
} //TODO : digunakan untuk membuat 3 tab. tab 1 memanggil kelas _HomeState, tab 2 meamnggil kelas SnackBar, tab 3 memanggil kelas list.
class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Weh Wes Metu SnackBar e!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
} //TODO : digunakan untuk menampilkan snackbar saat button di tekan.
class list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = '';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ),
      ),
    );
  }
} //TODO : digunakan untuk menampilkan listView dengan isi map, album, dan phone.


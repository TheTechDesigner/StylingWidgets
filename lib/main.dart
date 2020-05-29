import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF832685),
        primaryColorLight: Color(0xFFC81379),
        accentColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Styling Widgets';

  double paddingValue = 20;
  var isLightTheme = true;

  animatedPadding() {
    setState(() {
      paddingValue == 20 ? paddingValue = 100 : paddingValue = 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      // MediaQuery
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 4,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              // Padding
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),
            // AnimatedPadding
            AnimatedPadding(
              padding: EdgeInsets.all(paddingValue),
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: InkWell(
                onTap: () {
                  setState(() {
                    animatedPadding();
                  });
                },
                child: Container(
                  height: 125.0,
                  width: 125.0,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
            // Theme
            Theme(
              data: ThemeData(primaryColor: Colors.purple),
              child: Container(
                height: 150.0,
                width: 150.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            // AnimatedTheme
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedTheme(
                duration: Duration(seconds: 5),
                data: isLightTheme ? ThemeData.light() : ThemeData.dark(),
                curve: Curves.linear,
                child: Builder(builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        isLightTheme = !isLightTheme;
                      });
                    },
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
        buttonColor: Colors.purple,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class Kitten {
  const Kitten({this.name, this.description, this.age, this.imageUrl});
  final String name;
  final String description;
  final String age;
  final String imageUrl;
}

final String server =
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";
final List<Kitten> _kittens = <Kitten>[
  Kitten(
    name: 'Mittens',
    description:
        'We use cookies to improve our website to make sure you have a better browsing experience',
    age: '5',
    imageUrl: 'assets/1.jpg',
  ),
  Kitten(
    name: 'Fulffy',
    description:
        'We use cookies to improve our website to make sure you have a better browsing experience',
    age: '7',
    imageUrl: 'assets/4.jpg',
  ),
  Kitten(
    name: 'Scooter',
    description:
        'We use cookies to improve our website to make sure you have a better browsing experience',
    age: '9',
    imageUrl: 'assets/3.jpg',
  ),
  Kitten(
    name: 'Steve',
    description:
        'We use cookies to improve our website to make sure you have a better browsing experience',
    age: '11',
    imageUrl:'assets/2.jpg',
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.asset(
          kitten.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(kitten.name, style: localTheme.textTheme.headline4),
            Text(
              '${kitten.age} months old',
              style: localTheme.textTheme.headline6
                  .copyWith(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16.0),
            Text(
              kitten.description,
              style: localTheme.textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(children: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('I\'M ALLARGIC'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: const Text('ADOPT'),
                ),
              ]),
            )
          ]),
        ),
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _kittens[index])),
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          _kittens[index].name,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avilable Kittens'),
      ),
      body: ListView.builder(
        itemCount: _kittens.length,
        itemExtent: 60,
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}

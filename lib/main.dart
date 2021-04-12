import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => MyHomePage(title: 'Página inicial'),
        "/screen2": (context) => Screen2(),
        "/screen3": (context) => Screen3()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title), 
        /* leading: IconButton( //COMENTAR PARA TESTES EM OUTROS CASOS DE USO
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            final can = Navigator.canPop(context); 
            if(can) {
              Navigator.pop(context);
            } else {
              print('Não podemos fechar essa rota');
            }
          },
        ), */
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/screen2");
        },
        tooltip: 'Increment',
        child: Icon(Icons.send),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Página 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pushNamed(context, '/screen3');
          //ou
          Navigator.push(context, 
            CupertinoPageRoute(
              builder: (context) => Screen3(),
              settings: RouteSettings(name: "/screen3", arguments: 'oi parça!'),
            )
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.send),
      ),
    );
  }
}

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  build(BuildContext context) {
    //final args = ModalRoute.of(context).settings.arguments;
    //print('my args: $args');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Screen3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //fecha a tela atual, as que estão entre a atual e a especificada em withname, navegando para a tela especificada em withName
          //Navigator.popUntil(context, ModalRoute.withName("/"));

          //Navega para a tela 4 e fecha todas as telas até que chega na tela especificada (screen 2)
          //Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => Screen4()), ModalRoute.withName("/screen2"));

          //Navega para uma tela específicada e fecha todas as outras que estavam na pilha, incluindo a rota inicial
          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => Screen4()), (route) => false);
        },
        tooltip: 'Increment',
        child: Icon(Icons.send),
      ),
    );
  }
}

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        tooltip: 'Increment',
        child: Icon(Icons.send),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Counter extends ChangeNotifier{
  var _count=0;
  int get count{
    return _count;
  }
  void resetCounter()
  {
    _count=0;
    notifyListeners();
  }
  void incrementCounter(){
    _count +=1;
    notifyListeners();
  }
  void decrementCounter(){
    _count -=1;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create:(context)=>Counter(),
        child:MaterialApp(
          title: 'Insta Store',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: CounterPage(),
        )
    );

  }
}

class CounterPage extends StatelessWidget{
  const CounterPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Counter using provider'),
        actions:<Widget> [
          IconButton(onPressed: (){
            Provider.of<Counter>(
                context,listen:false
            ).resetCounter();
          }, icon: Icon(Icons.restart_alt))
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Center(
              child: CounterDisplay(),
            )),
            CounterButton(),
          ],
        ),
      ),
    );
  }
}
class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
        builder:(context,counter,child){
          return Text(
            '${counter.count}',style: Theme.of(context).textTheme.displayLarge,
          );
        }
    );
  }
}
class CounterButton extends StatelessWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[Expanded(child: ElevatedButton(onPressed: () { Provider.of<Counter>(
            context,listen:false
        ).incrementCounter(); }, child: const Text('Increment'),)),
          SizedBox(width:8),
          Expanded(child:ElevatedButton(
            child:  const Text('Decrement'),
            onPressed: () { Provider.of<Counter>(
                context,listen:false
            ).decrementCounter(); } ,
          ))
        ],
      ),
    );
  }
}

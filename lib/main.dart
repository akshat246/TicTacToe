import 'package:flutter/material.dart';

void main() => runApp(MyApp(
));


class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var grid = ['-','-','-',
              '-','-','-',
              '-','-','-'];

  var win = '';

  var currentplayer = 'X';


  void drawx(i){
    if (grid[i] == '-') {
      setState(() {
        grid[i] = currentplayer;
        currentplayer = currentplayer == 'X' ? 'O' : 'X';
      });
      Winner(grid[i]);
    }
  }

  bool Move(i1,i2,i3,sign){
    if(grid[i1]== sign && grid[i2]== sign && grid[i3]== sign){
      return true;
  }
  return false;}


  void Winner(currents){
    if(Move(0,1,2,currents) || Move(3,4,5,currents) || Move(6,7,8,currents) ||
    Move(0,3,6,currents) || Move(1,4,7,currents) || Move(2,5,8,currents) ||
        Move(2,4,6,currents) || Move(0,4,8,currents)

    ){setState(() {
      win = currents;
    });

    }
  }

  void reset(){
    setState(() {
      grid = ['-','-','-',
        '-','-','-',
        '-','-','-'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
        body: Column(
          children: [
            if(win != '') Text('$win Won', style: TextStyle(fontSize: 20,
            color: Colors.green),),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.black,
              child: GridView.builder(
                shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
                  itemCount: grid.length,
                  itemBuilder: (context, index) => Material(
                    color: Colors.cyan,
                    child: InkWell(
                      onTap: ()=>drawx(index),
                      splashColor: Colors.amber,
                      child: Center(child: Text(grid[index],
                      style: TextStyle(
                        fontSize: 50,
                      ),)
                      ),
                    ),
                  ),
),
            ),
            ElevatedButton.icon(onPressed: reset, icon:Icon(Icons.refresh), label: Text('Play Again')),
            Text('Tic Tac Toe By Akshat Verma, App Dev GDSC',
            style: TextStyle(fontSize: 20.0),),
          ],
        ),
      ),
    );

  }
}


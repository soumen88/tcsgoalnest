import 'package:flutter/material.dart';
import 'package:tcsgoalnest/core/enumerations/counter_enum.dart';
import 'package:tcsgoalnest/core/repository/counter_controller.dart';

class StreamExampleScreen extends StatelessWidget {

  CounterController _controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goal Nest"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: _controller.getCounterStream(),
                builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                  if(snapshot.hasData){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome to Goal Nest"),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Counter",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "${snapshot.data}",
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                      ],
                    );
                  }
                  else{
                    return Center(
                      child: Text(
                          "Presently stream has no data",
                          style: TextStyle(
                            fontSize: 20
                          ),
                      ),
                    );
                  }
                },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton.icon(
                  onPressed: (){
                    _controller.getSink().add(CounterEnum.DECREMENT);
                  },
                  label: Text("Decrement"),
                  icon: Icon(
                    Icons.exposure_minus_1_outlined,
                    size: 40,
                  ),
                ),
                FilledButton.icon(
                  onPressed: (){
                      _controller.getSink().add(CounterEnum.INCREMENT);
                  },
                  label: Text("Increment"),
                  icon: Icon(
                    Icons.plus_one_sharp,
                    size: 40,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

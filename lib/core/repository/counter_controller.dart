import 'dart:async';

import 'package:tcsgoalnest/core/enumerations/counter_enum.dart';

class CounterController {
  int _counter = 0;

  final StreamController<CounterEnum> _eventController = StreamController<CounterEnum>();
  final StreamController<int> _counterController = StreamController<int>();

  ///Add a value in this to inserting the value
  StreamSink<CounterEnum> getSink(){
    return _eventController.sink;
  }
  StreamSink<int> getCounterSink(){
    return _counterController.sink;
  }

  ///Below function will allow to listen to the changes in stream
  Stream<CounterEnum> getEventStream(){
    return _eventController.stream;
  }
  Stream<int> getCounterStream(){
    return _counterController.stream;
  }

  ///A listener that would check which button was pressed, increment or decrement
  StreamSubscription? listener;

  CounterController(){
    listener = getEventStream().listen((CounterEnum? event){
        switch(event){
          case CounterEnum.INCREMENT:
            _counter = _counter + 1;
            print("Updated counter value $_counter");
            getCounterSink().add(_counter);
          case CounterEnum.DECREMENT:
            _counter = _counter - 1;
            getCounterSink().add(_counter);
          default:{
          }

        }
    });
  }
}
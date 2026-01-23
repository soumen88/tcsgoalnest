import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions getFirebaseOptions(){
    return devConfig;
  }



  static const FirebaseOptions devConfig = FirebaseOptions(
      apiKey: 'AIzaSyDkK-bFBTKteb0omT4i3HvrI2LpasBHFis',
      appId: '1:805104212172:android:1735677ee5bc123b0aca69',
      messagingSenderId: '805104212172',
      projectId: 'goalnest-fe00a',
      storageBucket: 'goalnest-fe00a.appspot.com',
      authDomain: 'goalnest-fe00a.firebaseapp.com',
      databaseURL: 'https://goalnest-fe00a-default-rtdb.firebaseio.com/',
      measurementId: ''
  );

  static const FirebaseOptions stageConfig = FirebaseOptions(
      apiKey: '',
      appId: '',
      messagingSenderId: '982938298',
      projectId: '',
      storageBucket: '',
      authDomain: '',
      databaseURL: '',
      measurementId: ''
  );

  static const FirebaseOptions prodConfig = FirebaseOptions(
      apiKey: '',
      appId: '',
      messagingSenderId: '982938298',
      projectId: '',
      storageBucket: '',
      authDomain: '',
      databaseURL: '',
      measurementId: ''
  );

}
import 'package:flutter/material.dart';
import 'package:push_notification/service/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Notification Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Local Notification Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: () {
              NotificationService().showNotification(title: 'Sample notification', body: 'It works!');
            }, child: Column(
              children: [
                Text('Regular Notification'),
              ],
            )),
            ElevatedButton(onPressed: () {
              final now = DateTime.now();
              final scheduledTime = now.add(Duration(seconds: 20));
              NotificationService().scheduleNotification(title: 'Sample notification', body: 'It works!', scheduledTime: scheduledTime);
            }, child: Column(
              children: [
                Text('Scheduled Notification'),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

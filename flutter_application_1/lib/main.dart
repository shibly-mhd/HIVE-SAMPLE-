import 'package:flutter/material.dart';
import 'package:flutter_application_1/add.dart';
import 'package:flutter_application_1/functions.dart';
import 'package:flutter_application_1/model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(personAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

/////////home screen
///
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (builder) => addscreen())),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: personNofier,
                  builder: (context, database, child) {
                    return ListView.builder(
                      itemCount: database.length,
                      itemBuilder: (context, index) {
                        final data = database[index];
                        return ListTile(
                            trailing: GestureDetector(
                                onTap: () {
                                  DeleteBtn(index);
                                },
                                child: Icon(Icons.check)),
                            title: Text(
                              data.name!,
                              style: TextStyle(fontSize: 30),
                            ),
                            subtitle: Text(data.age!));
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void DeleteBtn(int index) {
    deleteData(index);
  }
}

////////////ADD SCREEN ;


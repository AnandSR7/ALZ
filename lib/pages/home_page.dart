import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '/controllers/hive_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/models/reminder_model.dart';
import '/pages/reminder_page.dart';
import '/utils/helpers.dart';
import '/widgets/empty_page.dart';
import '/widgets/reminder_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ReminderBox reminderBox = ReminderBox();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:   Color.fromARGB(255, 79, 138, 189),
        centerTitle: true,
        title: Text('SCHEDULER'),
      ),
      body: Container(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: reminderBox.box.listenable(),
                builder: (context, Box<Reminder> reminders, widget) {
                  List<Reminder> listFromBox = reminders.values.toList();
                  //reversing the list to show new items on top
                  List<Reminder> remindersList = listFromBox.reversed.toList();
                  if (remindersList.isNotEmpty) {
                    return ListView.builder(
                      padding: EdgeInsets.all(2.0),
                      itemCount: remindersList.length,
                      itemBuilder: (context, index) {
                        var reminder = remindersList[index];
                        return ReminderCard(reminder, key: UniqueKey());
                      },
                    );
                  } else {
                    return EmptyPage();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab',
        child: Icon(EvaIcons.plus),
        onPressed: () => toPage(
            context,
            ReminderPage(
              isEdit: false,
            )),
      ),
    );
  }
}

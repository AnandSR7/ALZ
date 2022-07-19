import 'package:hive/hive.dart';
import '/models/reminder_model.dart';

class ReminderBox {
  Box<Reminder> box = Hive.box('reminders');

  void insertReminder(Reminder dream) => box.add(dream);

  void updateReminder(dynamic key, Reminder dream) => box.put(key, dream);

  void deleteReminder(int key) => box.delete(key);
}

import 'package:flutter/material.dart';
import 'package:i_love_tu/profilepage/request/card/form_new_card.dart';
import 'package:i_love_tu/services/Database_Api/database_helper.dart';
class NewCardSaveForm extends StatefulWidget {
  const NewCardSaveForm({super.key});

  @override
  State<NewCardSaveForm> createState() => _NewCardSaveFormState();
}

class _NewCardSaveFormState extends State<NewCardSaveForm> {
  @override
  Widget build(BuildContext context) {
    return  NewCardForm(
      onSaveUser: (user) async {
        final id = await UserAPI.getRowCount() + 1;
        final newUser = user.copy(id: id);
        await UserAPI.insert(([newUser.toJson()]));
      }
    );
  }
}
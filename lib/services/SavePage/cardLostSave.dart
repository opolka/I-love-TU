import 'package:flutter/material.dart';
import 'package:i_love_tu/profilepage/request/card/form_card_lost.dart';
import 'package:i_love_tu/services/Database_Api/database_helper.dart';
class CardLostSaveForm extends StatefulWidget {
  const CardLostSaveForm({super.key});

  @override
  State<CardLostSaveForm> createState() => _CardLostSaveFormState();
}

class _CardLostSaveFormState extends State<CardLostSaveForm> {
  @override
  Widget build(BuildContext context) {
    return  CardLostForm(
      onSaveUser: (userCardLost) async {
        final id = await UserAPI.getRowCount2() + 1;
        final newUser = userCardLost.copy(id: id);
        await UserAPI.insert2(([newUser.toJson()]));
      }
    );
  }
}
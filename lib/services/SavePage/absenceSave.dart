import 'package:flutter/material.dart';
import 'package:i_love_tu/profilepage/request/resign/absencePage.dart';
import 'package:i_love_tu/services/Database_Api/database_helper.dart';
class AbsenceSaveForm extends StatefulWidget {
  const AbsenceSaveForm({super.key});

  @override
  State<AbsenceSaveForm> createState() => _AbsenceSaveFormState();
}

class _AbsenceSaveFormState extends State<AbsenceSaveForm> {
  @override
  Widget build(BuildContext context) {
    return  AbsenceForm(
      onSaveUser: (userAbsence) async {
        final id = await UserAPI.getRowCount3() + 1;
        final newUser = userAbsence.copy(id: id);
        await UserAPI.insert3(([newUser.toJson()]));
      }
    );
  }
}
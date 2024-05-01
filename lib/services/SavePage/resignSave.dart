import 'package:flutter/material.dart';
import 'package:i_love_tu/profilepage/request/resign/resignPage.dart';
import 'package:i_love_tu/services/Database_Api/database_helper.dart';
class ResignSaveForm extends StatefulWidget {
  const ResignSaveForm({super.key});

  @override
  State<ResignSaveForm> createState() => _ResignSaveFormState();
}

class _ResignSaveFormState extends State<ResignSaveForm> {
  @override
  Widget build(BuildContext context) {
    return  ResignForm(
      onSaveUser: (userResign) async {
        final id = await UserAPI.getRowCount4() + 1;
        final newUser = userResign.copy(id: id);
        await UserAPI.insert4(([newUser.toJson()]));
      }
    );
  }
}
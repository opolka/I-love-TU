import 'package:flutter/material.dart';
import 'package:i_love_tu/profilepage/request/register/regis2.dart';
import 'package:i_love_tu/services/Database_Api/database_helper.dart';
class RegisterSaveForm extends StatefulWidget {
  const RegisterSaveForm({super.key});

  @override
  State<RegisterSaveForm> createState() => _RegisterSaveFormState();
}

class _RegisterSaveFormState extends State<RegisterSaveForm> {
  @override
  Widget build(BuildContext context) {
    return  RegisterForm(
      onSaveUser: (userRegister) async {
        final id = await UserAPI.getRowCount6() + 1;
        final newUser = userRegister.copy(id: id);
        await UserAPI.insert6(([newUser.toJson()]));
      }
    );
  }
}
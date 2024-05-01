import 'package:flutter/material.dart';
import 'package:i_love_tu/profilepage/request/inform/informPage2.dart';
import 'package:i_love_tu/services/Database_Api/database_helper.dart';
class RequirementSaveForm extends StatefulWidget {
  const RequirementSaveForm({super.key});

  @override
  State<RequirementSaveForm> createState() => _RequirementSaveFormState();
}

class _RequirementSaveFormState extends State<RequirementSaveForm> {
  @override
  Widget build(BuildContext context) {
    return  RequirementForm(
      onSaveUser: (userReqirement) async {
        final id = await UserAPI.getRowCount5() + 1;
        final newUser = userReqirement.copy(id: id);
        await UserAPI.insert5(([newUser.toJson()]));
      }
    );
  }
}
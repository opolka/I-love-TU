import 'package:gsheets/gsheets.dart';
import 'package:i_love_tu/model/informations.dart';

class UserAPI {
static const _credentials =r'''
{
  "type": "service_account",
  "project_id": "bold-gadget-421416",
  "private_key_id": "234d88c0cdcfa9516d645f7462dc36e3321721eb",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDaGa6PyrAk7xzr\nG0KRNv3zfrEy3zwexxiGniNU+M40+uI76cyVZNzBt7DZbOyCWsNrbncWUwNPg5vZ\n2TwY20Cv/zATspugolc+vvybsTOmiVsjLVJZ4mtl75A8wvyCDfxuzXF6CBJxs2HE\nHGrJgLEwu0U7AtOR2TMRV8zD3D+P5KhjqeOeVNrwxh1RaE2DDdTM0/xmUuxE8Jyx\n/4esQ0wv4n13XMC9rgYUll24fz6zTDdCz24HfVlCCgVUo9oQHtd2I9PeEN/CB/Sw\nCDa2XwYdTLlYbzYcJk4/eKEOvVh4RRJ9MwHalzLIM2tugwXmLMvdkbvD3pAopwUe\nq29x516lAgMBAAECggEACMLgrkoNdWOy8lwv+mFj0N+VWAkmWHOAWrgI4fr0svrO\nZ8BmmtcTFH0VOka+jCX/6lWPrHKSlCPMo52vD63kaq2CTZLuiYS7+HtM7nwvKlDO\nO8WFpLK3GcCGjMpQa8ZgDkYWeY56yd0o35XnUZzn1qCkkVBLFiAhhbV/Nkb8uVel\nI2gfsuAbzts8HLOqUY5PUpDjlaY/7LrC0IjViCaFTY62tc8mc4SbRBQpFNZQ75JN\nT7+s6pQ2SGlTVCE6qHw0WM+33feTvPPInsn9O88mXZyu20TYW6V7ycW6QhSSUdkI\n2680NaULKhCmXIy89deza4YqnGirWrnCAqp/Uz7aAQKBgQD234Pt+uVPzPwjxBha\nh9/67QKzGogg2A3GnmOZKK/kSn84cBfjUsrTzwFrBo8U51gyQJQoyvfA+yQ6AQJM\nyVf9XrOXluVqtD/J5N9h1cndtS/VWCIKk+GrgNfBRYvxW+9+g6qKyprcHbWhIV7n\n+YJ7Ca7K7HYEvGZl/caaRbI05QKBgQDiKdoR3tXnKhr6h9LdRnJJjNGpH0W/Rbqf\nj6gMPQoXcE82U6XzIl+WTB7JPR1N+xdk0UGfpQrLXU0F+5tyRYaoVezEHsWktvX5\n7GvLj9YY1synlmdlcH3/UxA+QcEmLbSsu79RkzPQ81/dHTEx1acENpe6lyuhdThR\nKnBXHC2mwQKBgQC0FtlnAV/GlwJYFPSvFe+OXNdbUD99th5WhbSiRcwJ/U5RHXRP\noFXVrWybZm16EkmEXxe1qlqRrKMArTvASCCn9C2Op8Uz0cm2vf82n35i/YmnWGN8\n0+QL+DFsDA/KQgazg9kk5ieR6xpUMMPK9Xj5yFZ6MYTmb4lDXZ1DbRRTAQKBgQCs\nNjAd8W8xcYdPg4MWCOFXjgnL3MswRTlA7JOKliQMCvHWLUWs6FyexmGe3JFm4q5C\nj3CHzpV0mxveVWNdVQGfRqZeBAx9Su/sGZFPVLwy98SoS8d5n3nhpG826LzZhG4S\nJXgd9pe7IMa7SNI/3y8o7yUD6L5JWEfEziryubstQQKBgEKUVsJBHzYvuTNxannF\nHb2VUiLwFbUIQMjQ4uxvobD7I2440sSJvVLO0ZeibRT9Bj5GpvieAnMO3cMo4xmu\n8kj4KIfJ+ic9LOxbF9d5dhahE0Ht88OctQoR6AUrdFn8FbNEpYeSgWsPPOmDnvvl\nbdQoSJwebTVcxTgrZn9hmyrg\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheet@bold-gadget-421416.iam.gserviceaccount.com",
  "client_id": "114657325634275105221",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheet%40bold-gadget-421416.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';
  static final _spreadsheetId = '1_AZls8kvs662oCLDu8GA1SOFdubKcwka87FBDl39M_s';
  static final _gsheet = GSheets(_credentials);
  static Worksheet? _newCardSheet;
  static Worksheet? _cardLostSheet;
  static Worksheet? _absenceSheet;
  static Worksheet? _resignSheet;
  static Worksheet? _requirementSheet;
  static Worksheet? _registerSheet;

  static Future init() async {
    try{
    final spreadsheet = await _gsheet.spreadsheet(_spreadsheetId);

    _newCardSheet = await _getWorkSheet(spreadsheet, title: 'ทำบัตรใหม่');
    final firstRow = UserFields.getFieldsNewCard();
    _newCardSheet!.values.insertRow(1, firstRow);

    _cardLostSheet = await _getWorkSheet(spreadsheet, title: 'บัตรสูญหาย');
    final firstRow1 = UserFields.getFieldslostCard();
    _cardLostSheet!.values.insertRow(1, firstRow1);

    _absenceSheet = await _getWorkSheet(spreadsheet, title: 'ลาพัก');
    final firstRow2 = UserFields.getFieldsAbsence();
    _absenceSheet!.values.insertRow(1, firstRow2);
    
    _resignSheet = await _getWorkSheet(spreadsheet, title: 'ลาออก');
    final firstRow3 = UserFields.getFieldsResign();
    _resignSheet!.values.insertRow(1, firstRow3);
    
    _requirementSheet = await _getWorkSheet(spreadsheet, title: 'ขอหลักฐาน');
    final firstRow4 = UserFields.getFieldsEvidence();
    _requirementSheet!.values.insertRow(1, firstRow4);

    _registerSheet = await _getWorkSheet(spreadsheet, title: 'ลงทะเบียน');
    final firstRow5 = UserFields.getFieldsRegister();
    _registerSheet!.values.insertRow(1, firstRow5);

    } catch (e) {
      print('Innit ERROR: $e');
    }
  }

 static Future<Worksheet> _getWorkSheet(spreadsheet, {required String title,}) async {
    try{
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

 static Future insert(List<Map<String,dynamic>> rowList) async {
    if(_newCardSheet == null) return;
    _newCardSheet!.values.map.appendRows(rowList);
  }
  static Future insert2(List<Map<String,dynamic>> rowList) async {
    if(_cardLostSheet == null) return;
    _cardLostSheet!.values.map.appendRows(rowList);
  }
  static Future insert3(List<Map<String,dynamic>> rowList) async {
    if(_absenceSheet == null) return;
    _absenceSheet!.values.map.appendRows(rowList);
  }
  static Future insert4(List<Map<String,dynamic>> rowList) async {
    if(_resignSheet == null) return;
    _resignSheet!.values.map.appendRows(rowList);
  }
  static Future insert5(List<Map<String,dynamic>> rowList) async {
    if(_requirementSheet == null) return;
    _requirementSheet!.values.map.appendRows(rowList);
  }
  static Future insert6(List<Map<String,dynamic>> rowList) async {
    if(_registerSheet == null) return;
    _registerSheet!.values.map.appendRows(rowList);
  }


  static Future<int> getRowCount() async {
    if (_newCardSheet == null) return 0;
    final lastRow = await _newCardSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }
  static Future<int> getRowCount2() async {
    if (_cardLostSheet == null) return 0;
    final lastRow = await _cardLostSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }
  static Future<int> getRowCount3() async {
    if (_absenceSheet == null) return 0;
    final lastRow = await _absenceSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }
  static Future<int> getRowCount4() async {
    if (_resignSheet == null) return 0;
    final lastRow = await _resignSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }
  static Future<int> getRowCount5() async {
    if (_requirementSheet == null) return 0;
    final lastRow = await _requirementSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }
  static Future<int> getRowCount6() async {
    if (_registerSheet == null) return 0;
    final lastRow = await _registerSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }


}
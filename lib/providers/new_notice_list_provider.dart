import 'dart:convert';

import 'package:cdv/models/notice_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewNoticeListProvider with ChangeNotifier {
  List<NoticeListModel> _duties = [];

  List<NoticeListModel> get duties {
    return [..._duties];
  }

  List findByDutyType(String dutyType) {
    return _duties.where((dt) => dt.dutyType == dutyType).toList();
  }

  Future<void> fetchAndSetProducts(int applicationId) async {
    final url = Uri.parse(
        'some api');
    try {
      final response = await http.post(url,
          body: jsonEncode(
            {
              "applicationno": 62857 //applicationId,
            },
          ),
          headers: {"content-type": "application/json"});
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      final List<NoticeListModel> loadedProducts = [];
      for (var data in extractedData) {
        loadedProducts.add(
          new NoticeListModel(
            id: data["id"],
            jobDescription: data["job_description"],
            advToDate: data["adv_to_date"],
            dutyType: data["duty_type"],
          ),
        );
      }
      _duties = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}

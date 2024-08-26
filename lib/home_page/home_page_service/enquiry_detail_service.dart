import 'package:enquiry_form/home_page/model/enquiry_detail_model/enquiry_detail_model.dart';
import 'package:hive/hive.dart';
import '../model/enquiry_model.dart';

class EnquiryDetailService{
  final String _boxName="enquiryDetail";

  Future<Box<EnquiryDetailModel>> get _box async=>await Hive.openBox<EnquiryDetailModel>(_boxName);


  Future<bool> addItem(EnquiryDetailModel data) async{
    try{
      var box=await _box;
      await box.add(data);
      return true;
    }catch(e){
      return false;
    }

  }

  Future<List<EnquiryDetailModel>> getAllEnquiryDetails() async{
    var box=await _box;
    return box.values.toList();
  }

  Future<List<dynamic>> getAllEnquiryDetailsKeys() async{
    var box=await _box;
    return box.keys.toList();
  }


  Future<EnquiryDetailModel?> getEnquiryDetails(key) async{
    var box=await _box;
    return box.get(key);
  }

  Future<void> updateEnquiryDetails(key,enquiryDetailModel) async{
    var box=await _box;
    await box.put(key,enquiryDetailModel);
  }


  Future<void> clear() async{
    var box=await _box;
    await box.clear();
  }

}
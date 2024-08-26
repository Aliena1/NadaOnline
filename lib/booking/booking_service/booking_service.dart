import 'package:enquiry_form/home_page/model/enquiry_detail_model/enquiry_detail_model.dart';
import 'package:hive/hive.dart';
import '../model/booking_detail_model/booking_detail_model.dart';

class BookingService{
  final String _boxName="booking";

  Future<Box<BookingDetailModel>> get _box async=>await Hive.openBox<BookingDetailModel>(_boxName);


  Future<bool> addItem(BookingDetailModel data) async{
    try{
      var box=await _box;
      await box.add(data);
      return true;
    }catch(e){
      return false;
    }

  }

  Future<List<BookingDetailModel>> getAllBookingDetails() async{
    var box=await _box;
    return box.values.toList();
  }

  Future<List<dynamic>> getAllBookingDetailsKeys() async{
    var box=await _box;
    return box.keys.toList();
  }


  Future<BookingDetailModel?> getBookingDetails(key) async{
    var box=await _box;
    return box.get(key);
  }

  Future<void> updateBookingDetails(key,bookingModel) async{
    var box=await _box;
    await box.put(key,bookingModel);
  }


  Future<void> clear() async{
    var box=await _box;
    await box.clear();
  }

}
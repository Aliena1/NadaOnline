import 'package:hive/hive.dart';
import '../model/enquiry_model.dart';

class HomePageService{
  final String _boxName="enquiryModel";

  Future<Box<Data>> get _box async=>await Hive.openBox<Data>(_boxName);


  Future<void> addItem(Data data) async{

    var box=await _box;
    await box.add(data);
  }

  Future<List<Data>> getAllCustomerTypes() async{
    var box=await _box;
    return box.values.toList();
  }

  void check() async{
    var box=await _box;
    print(box.isEmpty);
  }

  Future<void> clear() async{
    var box=await _box;
    await box.clear();
  }

}
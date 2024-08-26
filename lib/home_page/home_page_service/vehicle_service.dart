import 'package:hive/hive.dart';

import '../model/vehicle_model.dart';


class VehicleService{
  final String _boxName="vehicleModel";

  Future<Box<VehicleModel>> get _box async=>await Hive.openBox<VehicleModel>(_boxName);


  Future<void> addItem(VehicleModel data) async{

    var box=await _box;
    await box.add(data);
  }

  Future<List<VehicleModel>> getAllVehicle() async{
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
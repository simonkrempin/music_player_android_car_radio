import "package:flutter_blue/flutter_blue.dart";

FlutterBlue flutterBlue = FlutterBlue.instance;
BluetoothDevice? device;

Future<bool> isDeviceConnected() async => (await flutterBlue.connectedDevices).isNotEmpty;

Future<BluetoothDevice?> getDevice() async {
  device ??= await getFirstConnectedDevice();
  return device;
}

Future<List<BluetoothDevice>> getConnectedDevices() async {
  List<BluetoothDevice> connectedDevices = await flutterBlue.connectedDevices;
  return connectedDevices;
}

Future<BluetoothDevice?> getFirstConnectedDevice() async {
  List<BluetoothDevice> connectedDevices = await getConnectedDevices();
  // for (BluetoothDevice device in connectedDevices) {
  //   if (device.name == deviceName) {
  //     return device;
  //   }
  // }

  if (connectedDevices.isNotEmpty) {
    return connectedDevices[0];
  }

  return null; // Device not found
}

Future<List<BluetoothCharacteristic>> getTrackInformation(BluetoothDevice device) async {
  List<BluetoothService> services = await device.discoverServices();
  List<BluetoothCharacteristic> characteristics = [];

  for (BluetoothService service in services) {
    final characteristics = service.characteristics;
    for (final characteristic in characteristics) {
      characteristics.add(characteristic);
    }
  }

  return characteristics; // Characteristic not found
}

Future<void> play() async {
  BluetoothDevice? device = await getFirstConnectedDevice();
  if (device != null) {
    List<BluetoothCharacteristic> characteristics = await getTrackInformation(device);
    for (BluetoothCharacteristic characteristic in characteristics) {
      await characteristic.write([0x01]);
    }
  }
}
import 'dart:convert';
import 'dart:math' as math;

Map<String, dynamic> loadparseJson(Map<String, dynamic> audioDataMap) {
  final data = jsonDecode(audioDataMap["json"]);

  final List<int> rawSamples = List.castFrom<dynamic, int>(data['data']);
  List<int> filteredData = [];
  // Change this value to number of audio samples you want.
  // Values between 256 and 1024 are good for showing [RectangleWaveform] and [SquigglyWaveform]

  final int totalSamples = audioDataMap["totalSamples"];
  final double blockSize = rawSamples.length / totalSamples;

  for (int i = 0; i < totalSamples; i++) {
    final double blockStart = blockSize * i;
    int sum = 0;
    for (int j = 0; j < blockSize; j++) {
      sum = sum + rawSamples[(blockStart + j).toInt()].toInt();
    }
    filteredData.add((sum / blockSize).round().toInt());
  }
  final maxNum = filteredData.reduce((a, b) => math.max(a.abs(), b.abs()));

  final double multiplier = math.pow(maxNum, -1).toDouble();

  final samples = filteredData.map<double>((e) => (e * multiplier)).toList();

  return {"samples": samples};
}

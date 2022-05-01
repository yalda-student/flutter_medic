import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:flutter_medic_application/core/load_audio_data.dart';
import 'package:flutter_medic_application/presentation/resources/color_manager.dart';
import 'package:flutter_medic_application/presentation/resources/value_manager.dart';

class WaveformsDashboard extends StatefulWidget {
  const WaveformsDashboard({Key? key}) : super(key: key);

  @override
  State<WaveformsDashboard> createState() => _WaveformsDashboardState();
}

bool isPlaying = false;
late AudioCache audioPlayer;
late List<String> audioData;
late Duration maxDuration;

class _WaveformsDashboardState extends State<WaveformsDashboard> {
  late Duration elapsedDuration;
  late List<double> samples;

  int totalSamples = 256;
  WaveformType waveformType = WaveformType.polygon;
  late WaveformCustomizations waveformCustomizations;

  List<List<String>> audioDataList = [
    ['assets/dm.json', 'dance_monkey.mp3']
  ];

  Future<void> parseData() async {
    final json = await rootBundle.loadString(audioData[0]);
    Map<String, dynamic> audioDataMap = {
      "json": json,
      "totalSamples": totalSamples,
    };
    final samplesData = await compute(loadparseJson, audioDataMap);

    setState(() {
      samples = samplesData["samples"];
    });
  }

  @override
  void initState() {
    super.initState();
    audioData = audioDataList[0];
    audioPlayer = AudioCache(
      fixedPlayer: AudioPlayer(),
    );

    parseData();

    samples = [];
    maxDuration = const Duration(milliseconds: 1000);
    elapsedDuration = const Duration();

    audioPlayer.fixedPlayer!.onPlayerCompletion.listen((_) {
      setState(() {
        elapsedDuration = maxDuration;
      });
    });
    audioPlayer.fixedPlayer!.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        elapsedDuration = p;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    waveformCustomizations = WaveformCustomizations(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      activeColor: ColorManager.white,
      inactiveColor: ColorManager.white.withOpacity(0.35),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: SquigglyWaveformExample(
            maxDuration: maxDuration,
            elapsedDuration: elapsedDuration,
            samples: samples,
            waveformCustomizations: waveformCustomizations,
          ),
        ),
        const SizedBox(height: AppSize.s18),
        const _AudioController(),
      ],
    ));
  }
}

class SquigglyWaveformExample extends StatelessWidget {
  const SquigglyWaveformExample({
    Key? key,
    required this.maxDuration,
    required this.elapsedDuration,
    required this.samples,
    required this.waveformCustomizations,
  }) : super(key: key);

  final Duration maxDuration;
  final Duration elapsedDuration;
  final List<double> samples;
  final WaveformCustomizations waveformCustomizations;

  @override
  Widget build(BuildContext context) {
    return SquigglyWaveform(
      maxDuration: maxDuration,
      elapsedDuration: elapsedDuration,
      samples: samples,
      height: waveformCustomizations.height,
      width: waveformCustomizations.width,
      inactiveColor: waveformCustomizations.inactiveColor,
      invert: waveformCustomizations.invert,
      absolute: waveformCustomizations.absolute,
      activeColor: waveformCustomizations.activeColor,
      showActiveWaveform: waveformCustomizations.showActiveWaveform,
      strokeWidth: waveformCustomizations.borderWidth,
    );
  }
}

class _AudioController extends StatefulWidget {
  const _AudioController({Key? key}) : super(key: key);

  @override
  State<_AudioController> createState() => _AudioControllerState();
}

class _AudioControllerState extends State<_AudioController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // ElevatedButton(
        //   onPressed: () {
        //     audioPlayer.fixedPlayer!.pause();
        //   },
        //   child: const Icon(Icons.pause),
        // ),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.shuffle_rounded,
                color: ColorManager.white.withOpacity(0.75))),
        // SizedBox(width: AppSize.s14),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_double_arrow_left_rounded,
                color: ColorManager.white.withOpacity(0.75))),
        // SizedBox(width: AppSize.s14),
        IconButton(
          onPressed: () async {
            if (audioPlayer.fixedPlayer!.state == PlayerState.PLAYING) {
              isPlaying = false;
              audioPlayer.fixedPlayer!.pause();
            } else {
              isPlaying = true;
              if (audioPlayer.fixedPlayer!.state == PlayerState.PAUSED) {
                audioPlayer.fixedPlayer!.resume();
              } else {
                await playAudio();
              }
            }
            setState(() {});
          },
          icon: Container(
            width: 250.0,
            height: 250.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                color: ColorManager.white),
            child: Icon(
                audioPlayer.fixedPlayer!.state == PlayerState.PLAYING
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                color: ColorManager.primary),
          ),
        ),
        // SizedBox(width: AppSize.s14),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_double_arrow_right_rounded,
                color: ColorManager.white.withOpacity(0.75))),
        // SizedBox(width: AppSize.s14),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.loop_rounded,
                color: ColorManager.white.withOpacity(0.75))),
      ],
    );
  }

  Future<void> playAudio() async {
    await audioPlayer.load(audioData[1]);
    await audioPlayer.play(audioData[1]);
    await Future.delayed(const Duration(milliseconds: 200));

    int maxDurationInmilliseconds =
        await audioPlayer.fixedPlayer!.getDuration();

    maxDuration = Duration(milliseconds: maxDurationInmilliseconds);
  }
}

enum WaveformType {
  polygon,
  rectangle,
  squiggly,
  curvedPolygon,
}

class WaveformCustomizations {
  WaveformCustomizations({
    required this.height,
    required this.width,
    this.activeColor = ColorManager.white,
    this.inactiveColor = Colors.blue,
    this.activeGradient,
    this.inactiveGradient,
    this.style = PaintingStyle.stroke,
    this.showActiveWaveform = true,
    this.absolute = false,
    this.invert = false,
    this.borderWidth = 1.0,
    this.activeBorderColor = Colors.white,
    this.inactiveBorderColor = Colors.white,
    this.isRoundedRectangle = false,
    this.isCentered = false,
  });

  double height;
  double width;
  Color inactiveColor;
  Gradient? inactiveGradient;
  bool invert;
  bool absolute;
  Color activeColor;
  Gradient? activeGradient;
  bool showActiveWaveform;
  PaintingStyle style;
  double borderWidth;
  Color activeBorderColor;
  Color inactiveBorderColor;
  bool isRoundedRectangle;
  bool isCentered;
}

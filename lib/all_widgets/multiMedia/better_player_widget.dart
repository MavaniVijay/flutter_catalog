import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class BetterPlayerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayerPlaylist(
            betterPlayerConfiguration: BetterPlayerConfiguration(),
            betterPlayerPlaylistConfiguration:
                BetterPlayerPlaylistConfiguration(),
            betterPlayerDataSourceList: createDataSet()),
      ),
    );
  }
}

List<BetterPlayerDataSource> createDataSet() {
  List dataSourceList = List<BetterPlayerDataSource>();
  dataSourceList.add(
    BetterPlayerDataSource(BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
  );
  return dataSourceList;
}

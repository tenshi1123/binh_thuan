// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YoutubePlayerDemoApp extends StatefulWidget {
//   const YoutubePlayerDemoApp({super.key, this.videoValue});
//   final String? videoValue;
//   @override
//   State<YoutubePlayerDemoApp> createState() => _YoutubePlayerDemoAppState();
// }

// String videoId = YoutubePlayer.convertUrlToId(
//         "https://www.youtube.com/embed/3xcGh4KHJQc?si=a-0sDMPKAKCdPttl") ??
//     '';

// class _YoutubePlayerDemoAppState extends State<YoutubePlayerDemoApp> {
//   late YoutubePlayerController _controller;
//   late TextEditingController _idController;
//   late TextEditingController _seekToController;

//   bool _isPlayerReady = false;
//   final List<String> _ids = [
//     videoId,
//     'gQDByCdjUXw',
//     'iLnmTe5Q2Qw',
//     '_WoCV4c6XOE',
//     'KmzdUe0RSJo',
//     '6jZDSSZZxjQ',
//     'p2lYr3vM_1w',
//     '7QUtEmBT_-w',
//     '34_PXCzGw1M',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(widget.videoValue ??
//               "https://www.youtube.com/embed/3xcGh4KHJQc?si=a-0sDMPKAKCdPttl") ??
//           '',
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: true,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     )..addListener(listener);
//     _idController = TextEditingController();
//     _seekToController = TextEditingController();
//   }

//   void listener() {
//     if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//       setState(() {});
//     }
//   }

//   @override
//   void deactivate() {
//     // Pauses video while navigating to next page.
//     _controller.pause();
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _idController.dispose();
//     _seekToController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//       onExitFullScreen: () {
//         // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
//         SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//       },
//       player: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//         progressIndicatorColor: Colors.blueAccent,
//         topActions: <Widget>[
//           const SizedBox(width: 8.0),
//           Expanded(
//             child: Text(
//               _controller.metadata.title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//               ),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.settings,
//               color: Colors.white,
//               size: 25.0,
//             ),
//             onPressed: () {
//               log('Settings Tapped!');
//             },
//           ),
//         ],
//         onReady: () {
//           _isPlayerReady = true;
//         },
//         onEnded: (data) {
//           _controller
//               .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
//           _showSnackBar('Next Video Started!');
//         },
//       ),
//       builder: (context, player) => Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           title: const Text(
//             'Youtube Player Flutter',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: ListView(
//           children: [
//             player,
//           ],
//         ),
//       ),
//     );
//   }

//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontWeight: FontWeight.w300,
//             fontSize: 16.0,
//           ),
//         ),
//         backgroundColor: Colors.blueAccent,
//         behavior: SnackBarBehavior.floating,
//         elevation: 1.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(50.0),
//         ),
//       ),
//     );
//   }
// }

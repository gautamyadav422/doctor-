
import 'package:flutter/material.dart';
import 'package:gmoney/util/utils.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



class YouTubeView extends StatefulWidget {
  const YouTubeView({Key? key}) : super(key: key);

  @override
  _YouTubeViewState createState() => _YouTubeViewState();
}

class _YouTubeViewState extends State<YouTubeView>{


  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  int? indexUpdate = 0;

 final List<YoutubePlayerController> _controllers = [
    'ZjjEzUwr8Tg',
    'NG6pvXpnIso',
    'XgUOSS30OQk',
    'LKKgYpC-EPQ',
    'ktTajqbhIcY',
    'c1xLMaTUWCY'
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        disableDragSeek: true
      ),
    ),
  )
      .toList();





  @override
  void deactivate() {
    print("deactivate >>>");
/*    for(var element in _controllers){
        element.pause();
    }*/
    // Pauses video while navigating to next page.
    //_controllers.first.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose >>>");
   // _controllers.first.pause();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return
    Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height/3.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Expert advice from our doctors",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: DefaultColor.appDarkBlue),),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 12),
              itemCount: _controllers.length+1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                print("${_controllers.length+1}");
                if(_controllers.length == index){
                  return  GestureDetector(
                      onTap: ()=> launch("https://www.youtube.com/results?search_query=gmoney+health+show"),
                      child: Image.asset("assets/images/YOUTUBE.png"));
                }else{
              return Container(
                margin: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: VisibilityDetector(
                    key: Key("unique key"),
                    onVisibilityChanged: (VisibilityInfo info) {
                      debugPrint("${info.visibleFraction} of my widget is visible");
                      if(info.visibleFraction == 0){
                        for(var v in _controllers){
                          v.pause();
                        }
                      }
                      else{}
                    },
                    child: YoutubePlayer(
                      width:MediaQuery.of(context).size.width/1.3,
                      key: ObjectKey(_controllers[index]),
                      controller: _controllers[index],
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.amber,
                      progressColors: ProgressBarColors(
                        playedColor: Colors.amber,
                        handleColor: Colors.amberAccent,
                      ),
                      /*onReady: () {
                        _controller.addListener(listener);
                      },*/
                    ),
                  ),
                ),
              );}
            }),
          ),
        ],
      ),
    );
  }
}
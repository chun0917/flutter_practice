import 'package:flutter/material.dart';
import 'package:flutter_application_0117/data_model.dart';
import 'package:flutter_application_0117/get_api.dart';
import 'package:flutter_application_0117/api_detail.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> _users = new Map<String, dynamic>();
  Map<String, dynamic> _usersDisplay = new Map<String, dynamic>();
  Future<List<Station>>? futureStationList;
  late Color aqiTextBackgroundColor;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers().then((value) {
      setState(() {
        _isLoading = false;
        _users.addAll(value);
        _usersDisplay = _users;
        print(_usersDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Station>>(
        future: futureStationList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            debugPrint('${snapshot.data}');
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                if (!_isLoading) {
                return index == 0 ? _searchBar() : AQIListDetail(cityName: this._usersDisplay[index - 1],aqiPoint: this._usersDisplay[index - 1],county: this._usersDisplay[index - 1],status: this._usersDisplay[index - 1],windSpeed: this._usersDisplay[index - 1],importDate: this._usersDisplay[index - 1]);
              } 
                debugPrint("build: $index");

                if (snapshot.data![index].aqi >= 0 && snapshot.data![index].aqi <=50) {
                  aqiTextBackgroundColor = Colors.green;
                } else if (snapshot.data![index].aqi >= 51 && snapshot.data![index].aqi <= 100) {
                  aqiTextBackgroundColor = Colors.yellow;
                } else if (snapshot.data![index].aqi >= 101 && snapshot.data![index].aqi <= 150) {
                  aqiTextBackgroundColor = Colors.orange;
                } else if (snapshot.data![index].aqi >= 151 && snapshot.data![index].aqi <= 200) {
                  aqiTextBackgroundColor = Colors.red;
                } else if (snapshot.data![index].aqi >= 201 && snapshot.data![index].aqi <= 300) {
                  aqiTextBackgroundColor = Colors.purple;
                } else if (snapshot.data![index].aqi > 300) {
                  aqiTextBackgroundColor = Colors.redAccent.shade700;
                }

                return ListTile(
                  title: Text(snapshot.data![index].siteName,textAlign: TextAlign.center,),
                  subtitle: Container(
                    constraints: const BoxConstraints(maxWidth: 10, maxHeight: 20),
                    padding: const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
                    decoration: BoxDecoration(
                      color: aqiTextBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                      ),
                    ),
                    child: Text(
                      snapshot.data![index].aqi.toString(), 
                      style: TextStyle(color: Colors.black, backgroundColor: aqiTextBackgroundColor,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AQIListDetail(
                      cityName: snapshot.data![index].siteName,
                      aqiPoint: snapshot.data![index].aqi.toString(),
                      county: snapshot.data![index].county,
                      status: snapshot.data![index].status,
                      windSpeed: snapshot.data![index].windSpeed,
                      importDate: snapshot.data![index].importDate,
                    )));
                    debugPrint("City Name: ${snapshot.data![index].siteName}");
                    debugPrint("City AQI: ${snapshot.data![index].aqi}");
                  },
                  trailing: const Icon(Icons.navigate_next),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    ); 
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Users List'),
    //   ),
    //   body: SafeArea(
    //     child: Container(
    //       child: ListView.builder(
    //         itemBuilder: (context, index) {
    //           if (!_isLoading) {
    //             return index == 0 ? _searchBar() : UserTile(user: this._usersDisplay[index - 1]);
    //           } else {
    //             return LoadingView();
    //           }
    //         },
    //         itemCount: _usersDisplay.length + 1,
    //       ),
    //     ),
    //   ),
    // );
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            _usersDisplay = _users.where((u) {
              var fName = u.siteName.toLowerCase();
              return fName.contains(searchText);
            }).toList();
          });
        },
        // controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Users',
        ),
      ),
    );
  }
}
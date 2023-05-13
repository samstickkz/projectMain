import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class Bbal extends StatefulWidget {
  const Bbal({Key? key}) : super(key: key);

  @override
  State<Bbal> createState() => _BbalState();
}
Timer? timer;
class _BbalState extends State<Bbal> {
  List<Team> teams = [];

  Future<void> getTeams() async {
    var response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en'));
    var jsonData = jsonDecode(response.body);
    print(response.body);

    if (jsonData is List) { // check if jsonData is a List
      for (var eachTeam in jsonData) {
        final team = Team(
          id: eachTeam['id'],
          symbol: eachTeam['symbol'],
          name: eachTeam['name'],
          currentPrice: eachTeam['current_price']?.toDouble() ?? 0.0,
        );
        teams.add(team);
      }
      print(jsonData);
    } else {
      print('jsonData is not a List');
    }
  }


  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getTeams());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Price'),
      ),
      body: SafeArea(

        child: FutureBuilder(
          future: getTeams(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: teams.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(

                        title: Text(teams[index].id),

                          trailing:  Text('\$${teams[index].currentPrice
                                  .toStringAsFixed(2)}'),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }


}
import 'package:flutter/material.dart';
import 'package:mvvm/Data/Response/status.dart';
import 'package:mvvm/Utils/routeNames.dart';
import 'package:mvvm/Utils/utils.dart';
import 'package:mvvm/ViewModel/homeViewModel.dart';
import 'package:mvvm/ViewModel/userViewModel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel _homeViewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    _homeViewModel.fetchMoviesListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'HOME',
          style: TextStyle(letterSpacing: 1),
        ),
        elevation: 0,
        actions: [
          InkWell(
            onTap: (() {
              userPreferences.removeUser().then((value) {
                Navigator.pushNamed(context, RouteNames.loginRoute);
              }).onError((error, stackTrace) {
                Utils().flushbarErrorMessage(error.toString(), context);
              });
            }),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 32.0, 0),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: ((BuildContext context) => _homeViewModel),
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) {
            switch (value.moviesList.status!) {
              case Status.LOADING:
                return Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              case Status.ERROR:
                return Text(value.moviesList.message.toString());
              case Status.COMPLETED:
                return GridView.builder(
                  itemCount: value.moviesList.data!.data!.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: (value.moviesList.data!.data![index].coverUrl
                                  .toString()) !=
                              'null'
                          ? Image.network(
                              value.moviesList.data!.data![index].coverUrl
                                  .toString(),
                            )
                          : Container(
                              color: Colors.yellow,
                              child: const Center(
                                child: Text('No Image Found'),
                              ),
                            ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}


/*
 return  ListView.builder(
                  itemCount: value.moviesList.data!.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          height: height * .2,
                          width: width * .1,
                          value.moviesList.data!.data![index].coverUrl
                              .toString(),
                        ),
                        title: Text(value.moviesList.data!.data![index].title
                            .toString()),
                        trailing: Text(
                            '${value.moviesList.data!.data![index].duration.toString()} Minutes'),
                      ),
                    );
                  },
                ); 
 
*/
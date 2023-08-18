import 'package:flutter/material.dart';
import 'package:eyecon/screens/contacts.dart';
import 'package:eyecon/screens/historylog.dart';
import 'package:eyecon/widgets/homeTopTabs.dart';

class HomepageScreen extends StatefulWidget {
  @override
  HomepageScreenState createState() => HomepageScreenState();
}

class HomepageScreenState extends State<HomepageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  bool _isAppBarVisible = true;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 280.0,
            automaticallyImplyLeading: false,
            snap: true,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: HomepageTab(),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.mic),
                        onPressed: () => _searchController.clear(),
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Perform the search here
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 48,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(text: 'History'),
                      Tab(text: 'Contact'),
                      Tab(text: 'Fav'),
                    ],
                  ),
                ),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification) {
                        setState(() {
                          _isAppBarVisible =
                              scrollNotification.scrollDelta! <= 0;
                        });
                      }
                      return true;
                    },
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Center(
                          child: CallLogScreen(),
                        ),
                        Center(
                          child: ContactListScreen(),
                        ),
                        Center(
                          child: Text(
                            'Fav',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

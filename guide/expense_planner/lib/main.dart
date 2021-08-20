import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import './models/transaction.dart';
import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'Personal Expenses';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.title,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      home: MyHomePage(title: this.title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  bool _showChart = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  List<Transaction> get _recentTransactions {
    return this._userTransactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime? chosenDate) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: chosenDate ??= DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      this._userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        // return NewTransaction(this._addNewTransaction);
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(this._addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      this._userTransactions.removeWhere((element) => element.id == id);
    });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(this.widget.title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => this._startAddNewTransaction(context),
                  child: Icon(CupertinoIcons.add),
                ),
              ],
            ),
          ) as PreferredSizeWidget
        : AppBar(
            title: Text(this.widget.title),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => this._startAddNewTransaction(context),
              ),
            ],
          );
  }

  Widget _buildToggleChartWidget(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Show Chart',
          style: theme.textTheme.title,
        ),
        Switch.adaptive(
          activeColor: theme.accentColor,
          value: this._showChart,
          onChanged: (val) {
            setState(() {
              this._showChart = val;
            });
          },
        ),
      ],
    );
  }

  double _getAvailableHeight(
      MediaQueryData mediaQuery, PreferredSizeWidget appBar) {
    return mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;
  }

  Widget _chartWidget(
      MediaQueryData mediaQuery, PreferredSizeWidget appBar, double mod) {
    return Container(
      height: this._getAvailableHeight(mediaQuery, appBar) * mod,
      child: Chart(this._recentTransactions),
    );
  }

  Widget _transactionListWidget(
      MediaQueryData mediaQuery, PreferredSizeWidget appBar, double mod) {
    return Container(
      height: this._getAvailableHeight(mediaQuery, appBar) * mod,
      child: TransactionList(this._userTransactions, this._deleteTransaction),
    );
  }

  List<Widget> _buildLandscapeContent(
      ThemeData theme, MediaQueryData mediaQuery, PreferredSizeWidget appBar) {
    return [
      this._buildToggleChartWidget(theme),
      this._showChart
          ? this._chartWidget(mediaQuery, appBar, 0.6)
          : this._transactionListWidget(mediaQuery, appBar, 0.6),
    ];
  }

  List<Widget> _buildPortraitContent(
      _, MediaQueryData mediaQuery, PreferredSizeWidget appBar) {
    return [
      this._chartWidget(mediaQuery, appBar, 0.3),
      this._transactionListWidget(mediaQuery, appBar, 0.7),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar = this._buildAppBar(context);
    final renderContent =
        isLandscape ? this._buildLandscapeContent : this._buildPortraitContent;

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: renderContent(Theme.of(context), mediaQuery, appBar),
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar as ObstructingPreferredSizeWidget,
            child: pageBody,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => this._startAddNewTransaction(context),
                  ),
          );
  }
}

import 'package:draggable_board/src/draggable/draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:genesis_tokens/genesis_tokens.dart';
import 'package:genesis_tokens_examples/genesis_tokens_examples.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final components = <Widget>[];
  final drawerComponents = {
    "atoms": <Widget>[],
    "molecules": <Widget>[],
    "organisms": <Widget>[],
  };
  var atoms = [
    GBadgeExamples(),
    GLineExamples(),
    GBadgeExamples(),
    GCardExamples(),
    GCircleContainerExamples(),
    GContainerExamples(),
    GDotExamples(),
    GHorizontalDividerExamples(),
    GIconExamples(),
    GImageExamples(),
    GLabelExamples(),
    GProgressBarExamples(),
    GTextFieldExamples(),
  ];
  var molecules = [
    GListTileMenuItemExamples(),
    GListCheckLabelExamples(),
    GTagExamples(),
    GLimitProgressExamples(),
    GListedLabelExamples(),
    GListTileGenericExamples(),
    GChipExamples(),
    GListTileStatementExamples(),
    GChartExamples(),
    GButtonCallbackExamples(),
    GArrowButtonsExamples(),
    GBadgedContainersExamples(),
    GDrawerButtonsExamples(),
    GFloatTagExamples(),
    GFloatingActionButtonsExamples(),
    GHeadlineExamples(),
    GHorizontalStepperExamples(),
    GIconButtonsExamples(),
    GLabelButtonsExamples(),
    GListTileButtonExamples(),
    GListTileCircleAvatarsExamples(),
    GListTileCirclesExamples(),
    GMultiLabelsExamples(),
    GProgressCardExamples(),
    GShortcutExamples(),
    GSwitchListTileExamples(),
  ];
  var organisms = [
    GExpansionPanelExamples(),
    GListSelectorExamples(),
    GSliverbarExamples(),
    GSliverAppBarExamples(),
    GAppBarUserExamples(),
    GBannerAnimatedExamples(),
    GStatusInvoiceExamples(),
    GHelperCardExamples(),
    GTrackerExamples(),
    GRequestCardExamples(),
    GBannerExamples(),
    GMenuSliverHeaderExamples(),
    GListHeaderExamples(),
    GInvestCardAnimatedExamples(),
    GInvestCardExamples(),
    GImageCardExamples(),
    GAppBarSearchableExamples(),
    GDescriptionCardExamples(),
    GBalanceExamples(),
    GChartCardExamples(),
    GStickyHeaderExamples(),
    GIdentifyExtractExamples(),
    GRepeatTransferExamples(),
    GAppBarSearchExamples(),
    GAppBarExamples(),
    GBalanceCardExamples(),
    GBillBoardCardExamples(),
    GBillBoardCardAnimatedExamples(),
    GBottomNavigationBarsExamples(),
    GCalendarExamples(),
    GDreamCardExamples(),
    GRadioListExamples(),
    GSearchPageExamples(),
    GSelectDateBottomExamples(),
    GShortcutSetExamples(),
    GSingleSelectionListExamples(),
    GTabBarExamples(),
    GValueShortcutExamples(),
    GResumeOperationsExamples(),
    GVoucherExamples(),
    GFilterOptionsExamples(),
    GExpansionTileExamples(),
  ];
  var behaviour = Behaviour.regular;
  @override
  void initState() {
    mount();
    super.initState();
  }

  void mount() {
    buildComponent(atoms, "atoms");
    buildComponent(molecules, "molecules");
    buildComponent(organisms, "organisms");
  }

  void buildComponent(List<ComponentExample> items, String name) {
    items.forEach((value) {
      final genesis = <Widget>[];
      value.examples(behaviour).forEach((key, value) {
        genesis.add(ListTile(
          title: Text(key),
          onTap: () {
            components.add(DraggableWidget(child: value));
            setState(() {});
            Navigator.pop(context);
          },
        ));
      });
      drawerComponents[name].add(ExpansionTile(
        title: Text(value.getName),
        children: genesis,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: "Atom",
                    ),
                    Tab(
                      text: "Mol",
                    ),
                    Tab(
                      text: "Org",
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ...drawerComponents['atoms'],
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ...drawerComponents['molecules'],
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ...drawerComponents['organisms'],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: components,
        ),
      ),
    );
  }
}

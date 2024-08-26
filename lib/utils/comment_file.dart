//tab lich hoc
// class ScheduleItem extends StatelessWidget {
//   const ScheduleItem({
//     super.key,
//     required this.lichHocSaptoi,
//     required this.daHoanThanh,
//     required this.document,
//   });
//   final List<LichHocModels> lichHocSaptoi;
//   final List<LichHocModels> daHoanThanh;
//   final List<DocumentModel> document;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: TabBar(
//         tabAlignment: TabAlignment.start,

//         padding: EdgeInsets.zero,
//         indicatorPadding: EdgeInsets.zero,
//         labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
//         isScrollable: true,
//         indicatorColor: keyBlack,
//         indicatorSize: TabBarIndicatorSize.label,
//         indicator: UnderlineTabIndicator(
//           borderSide: BorderSide(width: 2.w), //hight of indicator
//           insets: EdgeInsets.symmetric(
//               horizontal:
//                   20.w), //give some padding to reduce the size of indicator
//         ),
//         unselectedLabelColor: keyBlack.withOpacity(0.3),
//         labelColor: keyBlack,

//         tabs: _tabSchedule(lichHocSaptoi, daHoanThanh), //list of tabs
//       ),
//       body: TabBarView(
//         children: _tabs.map((String name) {
//           return SafeArea(
//             top: false,
//             bottom: false,
//             child: Builder(
//               builder: (BuildContext context) {
//                 return CustomScrollView(
//                   key: PageStorageKey<String>(name),
//                   slivers: <Widget>[
//                     SliverOverlapInjector(
//                       handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
//                           context),
//                     ),
//                     SliverPadding(
//                       padding: const EdgeInsets.all(8.0),
//                       sliver: SliverFixedExtentList(
//                         itemExtent: 120.h,
//                         delegate: SliverChildBuilderDelegate(
//                           (BuildContext context, int index) {
//                             return (name == 'Sắp tới')
//                                 ? CompleteLesson(
//                                     lichHoc: lichHocSaptoi[index],
//                                     document: document,
//                                   )
//                                 : CompleteLesson(
//                                     lichHoc: daHoanThanh[index],
//                                     document: document,
//                                   );
//                           },
//                           childCount: (name == 'Sắp tới')
//                               ? lichHocSaptoi.length
//                               : daHoanThanh.length,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }


// List<Widget> _tabSchedule(
//         List<LichHocModels> lichHocSaptoi, List<LichHocModels> daHoanThanh) =>
//     [
//       homeTab(title: "Sắp tới", isSeprator: false, count: lichHocSaptoi.length),
//       homeTab(title: "Đã hoàn thành", count: daHoanThanh.length),
//       //const SizedBox()
//     ];
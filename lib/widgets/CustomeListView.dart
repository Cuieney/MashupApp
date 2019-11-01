import 'package:flutter/material.dart';




class CustomListView<T> extends StatefulWidget {
  final bool isVertical;
  final List<T> dataList;
  final IndexedWidgetBuilder itemView;
  final IndexedWidgetBuilder separatorBuilder;

  const CustomListView({Key key, @required this.isVertical,
    @required this.itemView,
    @required this.separatorBuilder, @required this.dataList})
      : super(key: key);

  @override
  _CustomListViewState createState() => _CustomListViewState();
}



class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          scrollDirection: widget.isVertical?Axis.vertical:Axis.horizontal,
          itemBuilder: widget.itemView,
          separatorBuilder: widget.separatorBuilder,
          itemCount: widget.dataList.length),
    );
  }
}

class ViewHolder<R extends ViewHolderState> extends StatefulWidget {
  final R view;
  const ViewHolder({Key key,@required this.view}):super(key:key);

  @override
  ViewHolderState createState() => view;
}

abstract class ViewHolderState<T> extends State<ViewHolder> {
  T data;
  @override
  Widget build(BuildContext context);

  void refreshData(T mData) async{
    setState(() {
      data = mData;
    });
  }
}

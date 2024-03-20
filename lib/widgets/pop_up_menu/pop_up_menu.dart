import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'triangle_printer.dart';

abstract class MenuItemProvider {
  String? get menuTitle;
  Widget? get menuImage;
  TextStyle get menuTextStyle;
  TextAlign get menuTextAlign;
}

class MenuItem extends MenuItemProvider {
  Widget? image;
  String? title;
  TextStyle? textStyle;
  TextAlign? textAlign;

  MenuItem({
    this.title,
    this.image,
    this.textStyle,
    this.textAlign,
  });

  @override
  Widget? get menuImage => image;

  @override
  String? get menuTitle => title;

  @override
  TextStyle get menuTextStyle {
    return textStyle ??
        const TextStyle(
          color: Color(0xffc5c5c5),
          fontSize: 10.0,
        );
  }

  @override
  TextAlign get menuTextAlign => textAlign ?? TextAlign.center;
}

enum MenuType { big, oneLine }

typedef MenuClickCallback = Function(MenuItemProvider item);
typedef PopupMenuStateChanged = Function(bool isShow);

class PopupMenu {
  static var itemWidth = 72.0;
  static var itemHeight = 65.0;
  static var arrowHeight = 10.0;
  late OverlayEntry _entry;
  List<MenuItemProvider>? items;

  /// row count
  int? _row;

  /// col count
  int? _col;

  /// The left top point of this menu.
  Offset? _offset;

  Offset _buttonPosition = Offset.zero;

  /// if false menu is show above of the widget, otherwise menu is show under the widget
  final bool _isDown = false;

  /// The max column count, default is 4.
  int? _maxColumn;

  /// callback
  VoidCallback? dismissCallback;
  MenuClickCallback? onClickMenu;
  PopupMenuStateChanged? stateChanged;

  /// Cannot be null
  final BuildContext context;

  /// style
  Color? _backgroundColor;
  Color? _highlightColor;
  Color? _lineColor;

  /// It's showing or not.
  bool _isShow = false;
  bool get isShow => _isShow;

  bool _dismissable = true;

  PopupMenu({
    this.onClickMenu,
    required this.context,
    VoidCallback? onDismiss,
    int? maxColumn,
    Color? backgroundColor,
    Color? highlightColor,
    Color? lineColor,
    this.stateChanged,
    this.items,
  }) {
    dismissCallback = onDismiss;
    _maxColumn = maxColumn ?? 4;
    _backgroundColor = backgroundColor ?? const Color(0xff232323);
    _lineColor = lineColor ?? const Color(0xff353535);
    _highlightColor = highlightColor ?? const Color(0x55000000);
  }

  void show({
    required Rect rect,
    required GlobalKey widgetKey,
    bool dismissable = true,
    List<MenuItemProvider>? items,
  }) {
    this.items = items ?? this.items;
    dismissCallback = dismissCallback;
    _dismissable = dismissable;

    _calculatePosition(context: context, widgetKey: widgetKey);

    _entry = OverlayEntry(builder: (context) {
      return buildPopupMenuLayout(_offset);
    });

    Overlay.of(context).insert(_entry);
    _isShow = true;
    if (stateChanged != null) {
      stateChanged!(true);
    }
  }

  static Rect getWidgetGlobalRect(BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    return Rect.fromLTWH(
        offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);
  }

  void _calculatePosition(
      {required BuildContext? context, required GlobalKey widgetKey}) {
    _col = _calculateColCount();
    _row = _calculateRowCount();
    _offset = _calculateOffset(this.context, widgetKey);
  }

  Offset _calculateOffset(BuildContext context, GlobalKey widgetKey) {
    RenderBox? renderBox =
        widgetKey.currentContext!.findRenderObject() as RenderBox;
    _buttonPosition = renderBox.localToGlobal(Offset.zero);

    return _buttonPosition;
  }

  double menuWidth() {
    return itemWidth * _col!;
  }

  // This height exclude the arrow
  double menuHeight() {
    return itemHeight * _row!;
  }

  LayoutBuilder buildPopupMenuLayout(Offset? offset) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          dismiss();
        },
        onVerticalDragStart: (DragStartDetails details) {
          dismiss();
        },
        onHorizontalDragStart: (DragStartDetails details) {
          dismiss();
        },
        child: Stack(
          children: <Widget>[
            // triangle arrow
            Positioned(
              left: offset!.dx + 17.0,
              top: offset.dy + 40,
              child: CustomPaint(
                size: Size(15.0, arrowHeight),
                painter:
                    TrianglePainter(isDown: _isDown, color: _backgroundColor),
              ),
            ),
            // menu content
            Positioned(
              left: offset.dx - 100.0,
              top: offset.dy + 50.0,
              child: SizedBox(
                width: menuWidth(),
                height: menuHeight(),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: menuWidth(),
                          height: menuHeight(),
                          decoration: BoxDecoration(
                              color: _backgroundColor,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            children: _createRows(),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  List<Widget> _createRows() {
    List<Widget> rows = [];
    for (int i = 0; i < _row!; i++) {
      Color color =
          (i < _row! - 1 && _row != 1) ? _lineColor! : Colors.transparent;
      Widget rowWidget = Container(
        decoration:
            BoxDecoration(border: Border(bottom: BorderSide(color: color))),
        height: itemHeight,
        child: Row(
          children: _createRowItems(i),
        ),
      );

      rows.add(rowWidget);
    }

    return rows;
  }

  List<Widget> _createRowItems(int row) {
    List<MenuItemProvider> subItems =
        items!.sublist(row * _col!, min(row * _col! + _col!, items!.length));
    List<Widget> itemWidgets = [];
    int i = 0;
    for (var item in subItems) {
      itemWidgets.add(_createMenuItem(
        item,
        i < (_col! - 1),
      ));
      i++;
    }

    return itemWidgets;
  }

  // calculate row count
  int _calculateRowCount() {
    if (items == null || items!.isEmpty) {
      debugPrint('error menu items can not be null');
      return 0;
    }

    int itemCount = items!.length;

    if (_calculateColCount() == 1) {
      return itemCount;
    }

    int row = (itemCount - 1) ~/ _calculateColCount()! + 1;

    return row;
  }

  // calculate col count
  int? _calculateColCount() {
    if (items == null || items!.isEmpty) {
      debugPrint('error menu items can not be null');
      return 0;
    }

    int itemCount = items!.length;
    if (_maxColumn != 4 && _maxColumn! > 0) {
      return _maxColumn;
    }

    if (itemCount == 4) {
      return 2;
    }

    if (itemCount <= _maxColumn!) {
      return itemCount;
    }

    if (itemCount == 5) {
      return 3;
    }

    if (itemCount == 6) {
      return 3;
    }

    return _maxColumn;
  }

  double get screenWidth {
    double width = View.of(context).physicalSize.width;
    double ratio = View.of(context).devicePixelRatio;
    return width / ratio;
  }

  Widget _createMenuItem(MenuItemProvider item, bool showLine) {
    return _MenuItemWidget(
      item: item,
      showLine: showLine,
      clickCallback: itemClicked,
      lineColor: _lineColor,
      backgroundColor: _backgroundColor,
      highlightColor: _highlightColor,
    );
  }

  void itemClicked(MenuItemProvider? item) {
    if (onClickMenu != null) {
      onClickMenu!(item!);
    }
    if (_dismissable) {
      dismiss();
    }
  }

  void dismiss() {
    if (!_isShow) {
      // Remove method should only be called once
      return;
    }

    _entry.remove();
    _isShow = false;
    if (dismissCallback != null) {
      dismissCallback!();
    }

    if (stateChanged != null) {
      stateChanged!(false);
    }
  }
}

class _MenuItemWidget extends StatefulWidget {
  final MenuItemProvider? item;
  // 是否要显示右边的分隔线
  final bool showLine;
  final Color? lineColor;
  final Color? backgroundColor;
  final Color? highlightColor;

  final void Function(MenuItemProvider? item)? clickCallback;

  const _MenuItemWidget(
      {this.item,
      this.showLine = false,
      this.clickCallback,
      this.lineColor,
      this.backgroundColor,
      this.highlightColor});

  @override
  State<StatefulWidget> createState() {
    return _MenuItemWidgetState();
  }
}

class _MenuItemWidgetState extends State<_MenuItemWidget> {
  Color? highlightColor = const Color(0x55000000);
  Color? color = const Color(0xff232323);

  @override
  void initState() {
    color = widget.backgroundColor;
    highlightColor = widget.highlightColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        color = highlightColor;
        setState(() {});
      },
      onTapUp: (details) {
        color = widget.backgroundColor;
        setState(() {});
      },
      onLongPressEnd: (details) {
        color = widget.backgroundColor;
        setState(() {});
      },
      onTap: () {
        if (widget.clickCallback != null) {
          widget.clickCallback!(widget.item);
        }
      },
      child: Container(
          width: PopupMenu.itemWidth,
          height: PopupMenu.itemHeight,
          decoration: BoxDecoration(
              color: color,
              border: Border(
                  right: BorderSide(
                      color: widget.showLine
                          ? widget.lineColor!
                          : Colors.transparent))),
          child: _createContent()),
    );
  }

  Widget _createContent() {
    if (widget.item!.menuImage != null) {
      // image and text
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 30.0,
            height: 30.0,
            child: widget.item!.menuImage,
          ),
          SizedBox(
            height: 22.0,
            child: Material(
              color: Colors.transparent,
              child: Text(
                widget.item!.menuTitle!,
                style: widget.item!.menuTextStyle,
              ),
            ),
          )
        ],
      );
    } else {
      // only text
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Text(
            widget.item!.menuTitle!,
            style: widget.item!.menuTextStyle,
            textAlign: widget.item!.menuTextAlign,
          ),
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'package:markdown_widget/config/highlight_themes.dart' as theme;

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      fontFamily: 'Verdana', //Try remove it to see that font works very well
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: Viewer(
        position: null,
        sName: null,
        lenghtOfList: null,
        isAssets: null,
        scrollPosition: null),
  ));
}

class Viewer extends StatefulWidget {
  final int position;
  final String sName;
  final int lenghtOfList;
  final bool isAssets;
  final double scrollPosition;

  const Viewer(
      {Key key,
      @required this.position,
      @required this.sName,
      @required this.lenghtOfList,
      @required this.isAssets,
      @required this.scrollPosition})
      : super(key: key);
  @override
  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  String data = '''
# Объявления переменных и констант базовых типов

По традиции, унаследованной от языков Си и С++, новый экземпляр (переменная) простого типа вводится с помощью объявления:

```
    type name = expression;
```

- где type – название типа;

- name – имя экземпляра (переменной);

- expression – инициализирующее выражение "инициализирующее выражение" (например, константа).

Объявление обязательно завершается точкой с запятой.

Названия базовых типов с примерами объявлений приведены в таблице ниже.

В одном объявлении могут быть определены несколько переменных одного типа: type name1 = expression1, name2 = expression 2;

Переменные одного объявления отделяются друг от друга запятыми.

Пример:

```
    double pi=3.141593, e=2.718282, c=535.491656;
```

Простые (базовые) типы значений "базовые типы значений" \y "базовый тип значений"


	
| Тип | Описание | Пример |
| --- | --- | --- |
| sbyte | 8-битовый знаковый целый (1 байт) | sbyte val = 12;  |
| short | 16-битовый знаковый целый (2 байта) | short val = 12; |
| int | 32-битовый знаковый целый (4 байта) | int val = 12; |
| long | 64-битовый знаковый целый (8 байтов) | long val1 = 12;  long val2 = 34L; |
| byte | 8-битовый беззнаковый целый (1 байт) | byte val1 = 12; |
| ushort | 16-битовый беззнаковый целый (2 байта) | ushort val1 = 12; |
| uint | 32- битовый беззнаковый целый (4 байта) | uint val1 = 12;  uint val2 = 34U; |
| ulong | 64- битовый беззнаковый целый (8 байтов) | ulong val1 = 12;  ulong val2 = 34U;  ulong val3 = 56L;  ulong val4 = 78UL; |
| float | Вещественный с плавающей точкой с одинарной точностью (4 байта) | float val = 1.23F; |
| double | Вещественный с плавающей точкой с двойной точностью (8 байтов) | double val1 = 1.23;  double val2 = 4.56D; |
| bool | Логический тип; значение или false, или true | bool val1 = true;  bool val2 = false; |
| char | Символьный тип; значение – один символ Юникода (2 байта) | char val = 'h'; |
| decimal | Точный денежный тип, по меньшей мере 28 значимых десятичных разрядов (12 байтов) | decimal val = 1.23M; |


Введя формат объявления переменных, следует остановиться на вопросе выбора их имен.

Имя переменной – выбранный программистом идентификатор.

Идентификатор — это последовательность букв, десятичных цифр и символов подчеркивания, которая начинается не с цифры.

В языке C# в качестве букв допустимо применять буквы национальных алфавитов.

Таким образом, правильными идентификаторами будут, например, такие последовательности: Number_of_Line, объем_в_литрах, x14, mass.

В качестве имен, вводимых программистом, запрещено использовать служебные (ключевые) слова языка C#.

Перечень служебных слов можно найти в справочнике C#.

Инициализирующее выражение чаще всего константа, однако, может быть любым выражением, операнды которого имеют конкретные значения в момент объявления переменной.

По типу вычисляемого значения инициализирующее выражение должно соответствовать типу создаваемой переменной.

Примеры объявлений переменных:

```
    double pi2=6.28; int два=2;
```

В объявлении переменной может отсутствовать инициализация.

Однако, язык С# очень строг и не допускает существования в программе переменных с неопределёнными значениями.

Поэтому после объявления переменной без её инициализации необходимо каким-то образом присвоить ей значение.

Обычно для этого используют оператор присваивания:

```
    имя_переменной = выражение;
```

Пример (удельный заряд электрона в единицах СГСЭ/г):

```
    // объявление
    double electron_charge;

    // присваивание значения
    electron_charge=5.27e+17;
```

В отличие от литералов, которые сами по себе представляют собственные значения и не требуют предварительных объявлений, именованные константы вводятся с помощью конструкции:

```
    const type name = expression;
```

Отличие от объявления переменной: наличие модификатора const и о''';

  @override
  Widget build(BuildContext context) {
    double _txtScaleFactor = MediaQuery.of(context).textScaleFactor;
    var _textStyle = TextStyle(
        fontSize: _txtScaleFactor * 15.13, //edit or editable
        color: Theme.of(context).textTheme.bodyText1.color);
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            centerTitle: true,
            title: Text('Урок '),
            pinned: false,
            floating: true),
        SliverList(
          delegate: SliverChildListDelegate(MarkdownGenerator(
              data: data,
              childMargin:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              styleConfig: StyleConfig(
                  markdownTheme:
                      (Theme.of(context).brightness == Brightness.dark)
                          ? MarkdownTheme.darkTheme
                          : MarkdownTheme.lightTheme,
                  pConfig: PConfig(
                      //!!!!!!!!!#####################!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      //Yes, the problem is here. But I added all the fonts and announced them.
                      //If you set the font through the main theme, everything will work.
                      //The problem is changing the colors of the widget.
                      //
                      textStyle: TextStyle(fontFamily: 'Verdana'),
                      //!!!!!!!!!!!!!!########################!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

                      selectable: false,
                      linkGesture: (linkChild, url) => GestureDetector(
                            child: linkChild,
                            //  onTap: () => _launchURL(url),
                          )),
                  preConfig: PreConfig(
                    preWrapper: (preWidget, text) {
                      return Stack(
                        children: <Widget>[
                          preWidget,
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: Icon(Icons.content_copy),
                                onPressed: () {
                                  Clipboard.setData(
                                      new ClipboardData(text: text));
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Код скопирован')));
                                }),
                          )
                        ],
                      );
                    },
                  ))).widgets),
        ),
      ],
    ));
  }
}

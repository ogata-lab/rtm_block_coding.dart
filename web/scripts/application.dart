library application;

// ブロックコーディング用のライブラリ定義
import 'package:xml/xml.dart' as xml;
import 'dart:core';
import 'dart:collection';
@MirrorsUsed(targets: const [AddInPort, AddOutPort, InPortBuffer, OutPortBuffer, IsNewInPort, ReadInPort, WriteOutPort, DeclareVariable,
ReferVariable, Assign, BoolLiteral, IntegerLiteral, StringLiteral, RealLiteral, If, While, Else, Add, Subtract, Multiply, Divide,
Equals, NotEquals, LargerThan, LargerThanOrEquals, SmallerThan, SmallerThanOrEquals, Not], override: '*')
import 'dart:mirrors';

import 'package:rtcprofile/rtcprofile.dart';

part 'src/block_loader.dart';
part 'src/statement.dart';
part 'src/block.dart';
part 'src/base.dart';
part 'src/basic_operator.dart';
part 'src/literal.dart';
part 'src/condition.dart';
part 'src/flow_control.dart';
part 'src/io.dart';
part 'src/inport.dart';
part 'src/outport.dart';
part 'src/datatype.dart';
part 'src/variable.dart';
part 'src/port.dart';
part 'src/model.dart';
import 'dart:html' as html;
import 'package:rtm_block_coding/application.dart' as program;
import 'package:polymer/polymer.dart';
import '../../controller/controller.dart';

@CustomTag('literal')
class Literal extends PolymerElement {

  PolymerElement parentElement;

  Literal.created() : super.created();

  void onClicked(var e) {
    globalController.setSelectedElem(e, this);
    e.stopPropagation();
  }

  void select() {
    $['target'].style.border = 'ridge';
    ($['target'] as html.HtmlElement).style.borderColor = '#FF9F1C';
  }

  void deselect() {
    $['target'].style.border = '1px solid #B6B6B6';
  }

  bool is_container() {
    return false;
  }
}

@CustomTag('integer-literal')
class IntegerLiteral extends Literal {
  program.IntegerLiteral _model;

  set model(program.IntegerLiteral m) {
    _model = m;
    value = m.value;
  }

  get model => _model;

  @published int value = 1;
  IntegerLiteral.created() : super.created();

  void attached() {
    $['int-literal-input'].onChange.listen((var e) {
      _model.value = value;
    });

  }
}


@CustomTag('real-literal')
class RealLiteral extends Literal {
  program.RealLiteral _model;

  set model(program.RealLiteral m) {
    _model = m;
    value = m.value;
  }

  get model => _model;

  @published double value = 1.0;
  RealLiteral.created() : super.created();

  void attached() {
    $['real-literal-input'].onChange.listen((var e) {
      _model.value = value;
    });

  }
}

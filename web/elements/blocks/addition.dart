import 'dart:html' as html;
import 'package:rtm_block_coding/application.dart' as program;
import 'package:polymer/polymer.dart';
import '../../controller/controller.dart';

@CustomTag('calc-addition')
class Addition extends PolymerElement {

  program.Add _model;

  set model(program.Add m) {
    _model = m;
    value_a = m.value_a;
    value_b = m.value_b;
  }

  get model => _model;

  @published int value_a = 1;
  @published int value_b = 2;
  Addition.created() : super.created();

  void attached() {
    $['value1-input'].onChange.listen((var e) {
      _model.value_a = value_a;

//      globalController.refreshPanel();
    });

    $['value2-input'].onChange.listen((var e) {
      _model.value_b = value_b;

//      globalController.refreshPanel();
    });

    this.onClick.listen((var e) {
      globalController.setSelectedElem(e, this);
    });
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
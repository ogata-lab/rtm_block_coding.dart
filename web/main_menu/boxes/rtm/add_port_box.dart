part of boxes;


@PolymerRegister('data-type-dropdown')
class DataTypeDropDown extends PolymerElement {

  program.AddPort _model;

  async.StreamController<html.MouseEvent> _onSelect = new async.StreamController<html.MouseEvent>();
  async.Stream get onSelect => _onSelect.stream.asBroadcastStream();

  set model(program.AddPort m) {
    _model = m;
    selectType(m.dataType.typename);
  }

  get model => _model;

  DataTypeDropDown.created() : super.created();

  void attached() {
    var types = program.DataType.all_types;
    types.sort();

    int counter = 0;
    types.forEach((String typename) {
      $$('#dropdown').children.add(new html.Element.tag('paper-item')
        ..innerHtml = typename
        ..setAttribute('value', counter.toString())
      );
      counter++;
    });

    selectType(model.dataType.typename);

    $$('#dropdown').addEventListener('iron-select', onIronSelect);
  }

  void selectType(String name) {
    int counter = 0;
    $$('#dropdown').children.forEach((PaperItem p) {
      if (name == p.innerHtml) {
        ($$('#dropdown') as IronSelector).attrForSelected = ('value');
        ($$('#dropdown') as IronSelector).select(counter.toString());
        return;
      }
      counter++;
    });

    /*
    print('DataTypeDropdown.selectType($name) failed.');
    print('- Iterating Data');
    $$('#dropdown').children.forEach((PaperItem p) {
      print('-- ${p.innerHtml}');
    });
    print('-');
    */
  }

  @reflectable
  void onIronSelect(var e) {
    print('DataTYpeDropdown.onIronSelect($e, ${e.detail})');
    if (e.detail != null) {
      /*
      model.dataType =
      new program.DataType.fromTypeName(e.detail['item'].innerHtml);
      */
      //onTypeChange(model.dataType.typename);
      onTypeChange(e, e.detail['item'].innerHtml);
    }
  }



  void onTypeChange(html.MouseEvent e, String typename) {
    print('AddInPort.onTypeChange($typename)');
    model.dataType = new program.DataType.fromTypeName(typename);

    String name_ = model.name;

    _onSelect.add(e);
    /*
    globalController.findFromAllApp(program.AccessInPort, name_).forEach((program.AccessInPort port) {
      port.dataType = model.dataType;
      port.accessSequence = '';
    });

    globalController.findFromAllApp(program.ReadInPort, name_).forEach((program.ReadInPort port) {
      port.dataType = model.dataType;
      //port.accessSequence = '';
    });
    */

    globalController.refreshAllPanel(except: 'onInitialize');
  }


}


// @PolymerRegister('add-port-box')
class AddPortBox extends BoxBase {

  set model(program.AddPort m) {
    super.model = m;
    set('port_name', m.name);
    port_type = m.dataType.typename;
  }

  @property String port_name = "defaultName";
  @property String port_type = "defaultType";

  AddPortBox.created() : super.created();

  bool is_container() {
    return false;
  }

}
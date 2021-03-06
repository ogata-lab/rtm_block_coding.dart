part of boxes;

@PolymerRegister('add-inport-box')
class AddInPortBox extends AddPortBox {

  DataTypeDropDown dataTypeDropDown;

  static  AddInPortBox createBox(program.AddInPort m) {
    return new html.Element.tag('add-inport-box') as AddPortBox
      ..model = m;
  }

  AddInPortBox.created() : super.created();

  void attached() {
    dataTypeDropDown = $$('#datatype-dropdown');
    dataTypeDropDown.model = model;
    dataTypeDropDown.onSelect.listen(onIronSelect);
  }

  @reflectable
  void onNameChanged(var e, var d) {
    onNameChange(port_name);
  }

  @reflectable
  void onIronSelect(var e) {
    print('AddInPort.onIronSelect($e, ${e.detail})');
    if (e.detail != null) {
      onTypeChange((model as program.AddInPort).dataType.typename);
    }
  }

  void onNameChange(String new_name) {
    print('AddInPortBox.onNameChange($new_name)');
    String old_name = model.name;

    globalController.model.findFromAllApp(program.InPortBuffer, old_name).forEach((program.InPortBuffer port) {
      port.name = new_name;
    });

    globalController.model.findFromAllApp(program.ReadInPort, old_name).forEach((program.ReadInPort port) {
      port.name = new_name;
    });

    model.name = new_name;
    globalController.refreshAllPanel(except: 'onInitialize');
  }

  void onTypeChange(String typename) {
    print('AddInPort.onTypeChange($typename)');

    String name_ = model.name;
    globalController.model.findFromAllApp(program.InPortBuffer, name_).forEach((program.InPortBuffer port) {
      port.dataType = (model as program.AddInPort).dataType;
      port.accessSequence = '';
    });

    globalController.model.findFromAllApp(program.ReadInPort, name_).forEach((program.ReadInPort port) {
      port.dataType = (model as program.AddInPort).dataType;
      //port.accessSequence = '';
    });
  }



}


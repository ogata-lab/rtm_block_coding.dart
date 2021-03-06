part of boxes;

abstract class BoxFactory {


  static BoxBase parseBlock(program.Block block) {
    return new BoxFactoryImpl().parseBlock(block);
  }

  static BoxBase parseStatement(var children, program.Statement s) {
    return new BoxFactoryImpl().parseStatement(children, s);
  }

}
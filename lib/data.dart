import 'TileModel.dart';

String selectedTile = "";
int selectedIndex =0;
bool selected = true;
int points = 0;

List<TileModel> myPairs = <TileModel>[];
List<bool> clicked = <bool>[];

List<bool> getClicked(){

  List<bool> yoClicked = <bool>[];
  List<TileModel> myairs = <TileModel>[];
  myairs = getPairs();
  for(int i=0;i<myairs.length;i++){
    yoClicked[i] = false;
  }

  return yoClicked;
}

List<TileModel>  getPairs(){

  List<TileModel> pairs = <TileModel>[];

  TileModel tileModel = new TileModel(isSelected: true, imageAssetPath: '');

  //1
  tileModel.setImageAssetPath("images/fox.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: true);

  //2
  tileModel.setImageAssetPath("images/hippo.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(isSelected: true, imageAssetPath: '');

  //3
  tileModel.setImageAssetPath("images/horse.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: true);

  //4
  tileModel.setImageAssetPath("images/monkey.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(isSelected: true, imageAssetPath: '');
  //5
  tileModel.setImageAssetPath("images/panda.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: true);

  //6
  tileModel.setImageAssetPath("images/parrot.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(isSelected: true, imageAssetPath: '');

  //7
  tileModel.setImageAssetPath("images/rabbit.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: true);

  //8
  tileModel.setImageAssetPath("images/zoo.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(isSelected: true, imageAssetPath: '');

  return pairs;
}

List<TileModel>  getQuestionPairs(){

  List<TileModel> pairs = <TileModel>[];

  TileModel tileModel = new TileModel(isSelected: true, imageAssetPath: '');

  //1
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: true);

  //2
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(isSelected: true, imageAssetPath: '');

  //3
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: true);

  //4
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: true);
  //5
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(isSelected: true, imageAssetPath: '');

  //6
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: true);

  //7
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(isSelected: true, imageAssetPath: '');

  //8
  tileModel.setImageAssetPath("images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: true);

  return pairs;
}
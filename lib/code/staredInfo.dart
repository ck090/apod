class starredInfo {
  List imageUrls;
  List imageInfos;
  List imageCredits;
  List imageTitles;

  void _saveInfo(url, info, credits, titles) {
    imageUrls.add(url);
    imageInfos.add(info);
    imageCredits.add(credits);
    imageTitles.add(titles);
  }
  
}

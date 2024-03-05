import 'package:flutter/material.dart';

class SearchMapSelect extends StatefulWidget {
  const SearchMapSelect({Key? key}) : super(key: key);

  @override
  _SearchMapSelectState createState() => _SearchMapSelectState();
}

class _SearchMapSelectState extends State<SearchMapSelect> {
  String _selectedGu = '구를 선택하세요';
  String _selectedDong = '동을 선택하세요';

  final Map<String, List<String>> _guDongMap = {
    '구를 선택하세요': [],
    '강서구': [
      '전체',
      '강동동',
      '구랑동',
      '녹산동',
      '눌차동',
      '대저1동',
      '대저2동',
      '대항동',
      '동선동',
      '명지동',
      '미음동',
      '범방동',
      '봉림동',
      '생곡동',
      '성북동',
      '송정동',
      '식만동',
      '신호동',
      '죽동동',
      '죽림동',
      '지사동',
      '천성동',
      '화전동'
    ],
    '금정구': [
      '전체',
      '구서1동',
      '구서2동',
      '구서동',
      '금사동',
      '금성동',
      '남산동',
      '노포동',
      '두구동',
      '부곡1동',
      '부곡2동',
      '부곡3동',
      '부곡4동',
      '부곡동',
      '서1동',
      '서2동',
      '서3동',
      '서동',
      '선동',
      '오륜동',
      '장전1동',
      '장전2동',
      '장전3동',
      '장전동',
      '청룡동',
      '회동동'
    ],
    '기장군': ['전체', '기장읍', '일광읍', '장안읍', '정관읍', '철마면'],
    '남구': [
      '전체',
      '감만1동',
      '감만2동',
      '감만동',
      '대연1동',
      '대연3동',
      '대연4동',
      '대연5동',
      '대연6동',
      '대연동',
      '문현1동',
      '문현2동',
      '문현3동',
      '문현4동',
      '문현동',
      '용당동',
      '용호1동',
      '용호2동',
      '용호3동',
      '용호4동',
      '용호동',
      '우암1동',
      '우암2동',
      '우암동'
    ],
    '동구': [
      '전체',
      '범일1동',
      '범일2동',
      '범일4동',
      '범일5동',
      '범일동',
      '수정1동',
      '수정2동',
      '수정4동',
      '수정5동',
      '수정동',
      '좌천1동',
      '좌천4동',
      '좌천동',
      '초량1동',
      '초량2동',
      '초량3동',
      '초량6동',
      '초량동'
    ],
    '동래구': [
      '전체',
      '낙민동',
      '명륜1동',
      '명륜2동',
      '명륜동',
      '명장1동',
      '명장2동',
      '명장동',
      '복천동',
      '사직1동',
      '사직2동',
      '사직3동',
      '사직동',
      '수안동',
      '안락1동',
      '안락2동',
      '안락동',
      '온천1동',
      '온천2동',
      '온천3동',
      '온천동',
      '칠산동'
    ],
    '부산진구': [],
    '북구': [],
    '사상구': [],
    '사하구': [],
    '서구': [],
    '수영구': [],
    '연제구': [],
    '영도구': [],
    '중구': [],
    '해운대구': [],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchMapSelect'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: _selectedGu,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedGu = newValue;
                        _selectedDong =
                            _guDongMap[newValue]!.first; // Reset dong selection
                      });
                    }
                  },
                  items: _guDongMap.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: _selectedDong,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedDong = newValue;
                      });
                    }
                  },
                  items: _guDongMap[_selectedGu]!
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchMapSelect(),
  ));
}

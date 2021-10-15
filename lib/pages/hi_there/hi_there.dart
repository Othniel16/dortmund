import 'package:dortmund/exports.dart';
import 'package:flutter/material.dart';

class HiThere extends StatelessWidget {
  const HiThere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CenterWidget(
      leftChild: LeftWidget(),
      rightChild: RightWidget(),
    );
  }
}

class LeftWidget extends StatelessWidget {
  const LeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight / 20),
      child: Image.asset(Images.woman),
    );
  }
}

class RightWidget extends StatefulWidget {
  const RightWidget({Key? key}) : super(key: key);

  @override
  State<RightWidget> createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget> {
  List<String> interests = [];
  String? name, ageGroup, country, gender, occupation, note, url;
  final String submit = 'SUBMIT';

  final String title = 'Hi There ...';

  final String invite = '''We’d like you to be a part of this project – your
submission to our quick survey is welcome  ❤''';

  late PagesProvider pagesProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pagesProvider = Provider.of<PagesProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double titleSize =
          sizingInformation.isMobile ? FontSizes.semiLarge : FontSizes.large;
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: screenWidth / 25,
          right: screenHeight / 25,
          top: screenHeight / 35,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: titleSize),
            ),
            const SizedBox(height: 30.0),
            Text(
              invite,
              style: const TextStyle(
                color: Colors.white,
                fontSize: FontSizes.regular,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              color: Colors.grey,
              height: 1.5,
              width: MediaQuery.of(context).size.width / 3,
            ),
            const SizedBox(height: 30.0),
            UserInfoItem(label: 'Name', content: nameInput()),
            UserInfoItem(label: 'Gender', content: genderList()),
            UserInfoItem(label: 'Country', onHeaderTap: showCountryList),
            UserInfoItem(label: 'Age Group', content: ageList()),
            UserInfoItem(label: 'Occupation', content: occupationInput()),
            UserInfoItem(label: 'Social media url', content: urlInput()),
            UserInfoItem(
                label: 'Interest in women\'s affairs', content: interestList()),
            UserInfoItem(
              label: 'Outlook on women\'s empowerment',
              content: noteInput(),
            ),
            const SizedBox(height: 20.0),
            ArgonButton(
              height: 35,
              width: 83,
              color: Colors.white,
              child: Text(
                submit,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              loader: Container(
                padding: const EdgeInsets.all(10.0),
                child: const CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 1.5,
                ),
              ),
              onTap: (startLoading, stopLoading, btnState) async {
                if (btnState == ButtonState.Idle) {
                  startLoading();
                  await Future.delayed(const Duration(seconds: 3));
                  stopLoading();
                  await Future.delayed(const Duration(seconds: 1));
                  onSubmitTap();
                }
              },
            ),
            SizedBox(height: screenHeight / 20),
          ],
        ),
      );
    });
  }

  Widget ageList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: GroupButton(
        spacing: 10.0,
        runSpacing: 8.0,
        buttons: ageGroups,
        selectedColor: SiteColors.brown,
        mainGroupAlignment: MainGroupAlignment.start,
        onSelected: (index, isSelected) => ageGroup = ageGroups[index],
      ),
    );
  }

  void showCountryList() {
    return showCountryPicker(
      context: context,
      onSelect: (Country country) => this.country = country.name,
      countryListTheme: const CountryListThemeData(
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.zero,
        textStyle: TextStyle(fontSize: 16),
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          labelStyle: TextStyle(color: Colors.grey),
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget genderList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: GroupButton(
        spacing: 10.0,
        runSpacing: 8.0,
        buttons: genderOptions,
        selectedColor: SiteColors.brown,
        mainGroupAlignment: MainGroupAlignment.start,
        onSelected: (index, isSelected) => gender = genderOptions[index],
      ),
    );
  }

  Widget occupationInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        maxLength: 20,
        onChanged: (value) => occupation = value,
        style: const TextStyle(color: Colors.white),
        textCapitalization: TextCapitalization.words,
        decoration: textFieldDeco(hintText: 'Occupation'),
      ),
    );
  }

  Widget nameInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        maxLength: 30,
        keyboardType: TextInputType.name,
        onChanged: (value) => name = value,
        style: const TextStyle(color: Colors.white),
        textCapitalization: TextCapitalization.words,
        decoration: textFieldDeco(hintText: 'Name'),
      ),
    );
  }

  Widget noteInput() {
    String hintText = 'Note on your outlook on women\'s empowerment';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        maxLength: 100,
        onChanged: (value) => note = value,
        style: const TextStyle(color: Colors.white),
        decoration: textFieldDeco(hintText: hintText),
        textCapitalization: TextCapitalization.sentences,
      ),
    );
  }

  Widget urlInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        keyboardType: TextInputType.url,
        onChanged: (value) => url = value,
        style: const TextStyle(color: Colors.white),
        decoration: textFieldDeco(hintText: 'Social media url'),
      ),
    );
  }

  Widget interestList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: GroupButton(
        spacing: 10,
        isRadio: false,
        runSpacing: 8.0,
        buttons: interestOptions,
        selectedColor: SiteColors.brown,
        mainGroupAlignment: MainGroupAlignment.start,
        onSelected: (index, isSelected) {
          interests.add(interestOptions[index]);
        },
      ),
    );
  }

  void onSubmitTap() {
    pagesProvider.togglePageIndex(pagesProvider.currentPage + 1);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:small_hurry/shopHop/models/ShPaymentCard.dart';
import 'package:small_hurry/shopHop/utils/ShColors.dart';
import 'package:small_hurry/shopHop/utils/ShConstant.dart';
import 'package:small_hurry/shopHop/utils/ShImages.dart';
import 'package:small_hurry/shopHop/utils/ShStrings.dart';
import 'package:small_hurry/main/utils/AppWidget.dart';

import 'ShAddCardScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class ShQuickPayCardsScreen extends StatefulWidget {
  static String tag = '/ShQuickPayCardsScreen';

  @override
  ShQuickPayCardsScreenState createState() => ShQuickPayCardsScreenState();
}

class ShQuickPayCardsScreenState extends State<ShQuickPayCardsScreen> {
  List<ShPaymentCard> list = [];
  int? selectedCard = 0;

  editCard(ShPaymentCard card) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ShAddCardScreen(
                  paymentCard: card,
                )));
  }

  deleteCard(ShPaymentCard card) {
    setState(() {
      list.remove(card);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      list.add(ShPaymentCard());
      list.add(ShPaymentCard());
      list.add(ShPaymentCard());
      list.add(ShPaymentCard());
      list.add(ShPaymentCard());
      list.add(ShPaymentCard());
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final listView = ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
      itemBuilder: (item, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: spacing_standard_new),
          child: Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: <Widget> [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: editCard(list[index]),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
                  onPressed: deleteCard(list[index]),
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_outline,
                  label: 'Delete',
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedCard = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(
                  right: spacing_standard_new,
                  left: spacing_standard_new,
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 210,
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            card,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                            height: 210,
                          ),
                          Padding(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      text("Debit card", textColor: sh_white, fontSize: textSizeLargeMedium, fontFamily: fontBold),
                                      text("MVK Bank", textColor: sh_white, fontSize: textSizeLargeMedium, fontFamily: fontBold)
                                    ],
                                  ),
                                  SizedBox(
                                    height: spacing_middle,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Image.asset(
                                          chip,
                                          width: 50,
                                          height: 30,
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(
                                          height: spacing_standard_new,
                                        ),
                                        text("3434 3434 3434", textColor: sh_white, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                                        text("valid 12/12", textColor: sh_white, fontSize: textSizeSMedium),
                                        SizedBox(
                                          height: spacing_standard,
                                        ),
                                        text("JOHN", textColor: sh_white, fontFamily: fontMedium, fontSize: textSizeMedium),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              padding: EdgeInsets.all(14)),
                        ],
                      ),
                    ),
                    Radio(
                        value: index,
                        groupValue: selectedCard,
                        onChanged: (dynamic value) {
                          setState(() {
                            selectedCard = value;
                          });
                        },
                        activeColor: sh_white)
                  ],
                ),
              ),
            ),
          ),
        );
      },
      shrinkWrap: true,
      itemCount: list.length,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: sh_white,
        title: text(sh_title_payment, textColor: sh_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontBold),
        iconTheme: IconThemeData(color: sh_textColorPrimary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(spacing_standard_new),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  text(sh_lbl_quick_pay, textColor: sh_textColorPrimary, fontFamily: fontBold, fontSize: textSizeLargeMedium),
                  MaterialButton(
                    textColor: sh_colorPrimary,
                    padding: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: 0, bottom: 0),
                    child: text(sh_lbl_add_card, fontSize: textSizeSMedium, textColor: sh_colorPrimary),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(spacing_large),
                      side: BorderSide(color: sh_colorPrimary),
                    ),
                    onPressed: () {
                      ShAddCardScreen().launch(context);
                    },
                  )
                ],
              ),
            ),
            listView
          ],
        ),
      ),
    );
  }
}

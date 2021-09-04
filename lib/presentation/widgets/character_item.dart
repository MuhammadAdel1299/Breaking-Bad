import 'package:appbloc/constants/my_colors.dart';
import 'package:appbloc/constants/strings.dart';
import 'package:appbloc/data/model/characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetailsScreen , arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.charId,
            child: Container(
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      image: character.image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/place_holder.png',
                    ),
              color: MyColors.myGrey,
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.name}',
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

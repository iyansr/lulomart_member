import 'package:flutter/material.dart';
import 'package:lulomart_member/models/generasi2.dart';

class Generasi2List extends StatelessWidget {
  final List<Generasi2> generasi2;
  Generasi2List({this.generasi2});
  @override
  Widget build(BuildContext context) {
    Container getList(Generasi2 generasi2) {
      return Container(
        child: ListTile(
          title: Text('${generasi2.memberName}'),
          subtitle: Text('${generasi2.registerDate}'),
          trailing: SizedBox(
            height: 20.0,
            width: 20.0,
            child: IconButton(
              padding: EdgeInsets.all(0.0),
              icon: Icon(Icons.more_vert, size: 18.0),
              onPressed: () {},
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      itemCount: generasi2.length,
      separatorBuilder: (c, i) => Divider(),
      itemBuilder: (context, i) => getList(generasi2[i]),
      shrinkWrap: true,
    );
  }
}

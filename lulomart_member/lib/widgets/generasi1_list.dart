import 'package:flutter/material.dart';
import 'package:lulomart_member/models/generasi1.dart';

class Generasi1List extends StatelessWidget {
  final List<Generasi1> generasi1;
  Generasi1List({this.generasi1});
  @override
  Widget build(BuildContext context) {
    Container getList(Generasi1 generasi1) {
      return Container(
        child: ListTile(
          title: Text('${generasi1.memberName}'),
          subtitle: Text('${generasi1.registerDate}'),
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
      itemCount: generasi1.length,
      separatorBuilder: (c, i) => Divider(),
      itemBuilder: (context, i) => getList(generasi1[i]),
      shrinkWrap: true,
    );
  }
}

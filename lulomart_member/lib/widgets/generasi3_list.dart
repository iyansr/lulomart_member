import 'package:flutter/material.dart';
import 'package:lulomart_member/models/generasi3.dart';

class Generasi3List extends StatelessWidget {
  final List<Generasi3> generasi3;
  Generasi3List({this.generasi3});
  @override
  Widget build(BuildContext context) {
    Container getList(Generasi3 generasi3) {
      return Container(
        child: ListTile(
          title: Text('${generasi3.memberName}'),
          subtitle: Text('${generasi3.registerDate}'),
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
      itemCount: generasi3.length,
      separatorBuilder: (c, i) => Divider(),
      itemBuilder: (context, i) => getList(generasi3[i]),
      shrinkWrap: true,
    );
  }
}

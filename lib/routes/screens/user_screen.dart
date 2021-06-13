import 'package:applaluz_chat/models/user.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

RefreshController _refreshController = RefreshController(initialRefresh: false);

final usuarios = [
  User(id: '1', nombre: 'Juan', email: 'juan@gmail.com', online: true),
  User(id: '2', nombre: 'Maria', email: 'maria@gmail.com', online: false),
  User(id: '3', nombre: 'Eduardo', email: 'eduardo@gmail.com', online: true)
];

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Mi Nombre',
              style: TextStyle(color: Colors.black54),
            ),
            elevation: 1,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.black87),
              onPressed: () {
                Navigator.pushNamed(context, 'chat');
              },
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.check_circle, color: Colors.red[400]),
                //child: Icon(Icons.offline_bolt, color: Colors.red),
              )
            ]),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _cargarUsuarios,
          header: WaterDropHeader(
            complete: Icon(Icons.check, color: Colors.blue[400]),
            waterDropColor: Colors.red[400],
          ),
          child: _listViewUsuarios(),
        ));
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: BouncingScrollPhysics(), //pull to refresh
        itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(User usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        child: Text(usuario.nombre.substring(0, 2)),
        backgroundColor: Colors.red[500],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  _cargarUsuarios() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 2000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tarotcelestial/assets/custom-colors.dart';
import 'package:tarotcelestial/providers/user_provider.dart';
import '../../assets/util.dart';
import '../../controllers/sections/rooms_controller.dart';
import '../../repos/personalized_firebase_chat_core_repo.dart';
import 'admin/admin_chat.dart';
import 'chat.dart';

class RoomsPage extends StatefulWidget {
  String? id;
  RoomsPage({this.id});

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  bool _error = false;
  bool _initialized = false;
  User? _user;
  final RoomsController _roomsController = Get.put(RoomsController());

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  void initializeFlutterFire() async {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        setState(() {
          _user = user;
        });
      });
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Widget _buildAvatar(types.Room room) {
    var color = Colors.transparent;

    if (room.type == types.RoomType.direct) {
      try {
        final otherUser = room.users.firstWhere(
          (u) => u.id != _user!.uid,
        );

        color = getUserAvatarNameColor(otherUser);
      } catch (e) {
        // Do nothing if other user is not found
      }
    }

    final hasImage = room.imageUrl != null;
    final name = room.name ?? '';

    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: CircleAvatar(
        backgroundColor: hasImage ? Colors.transparent : color,
        backgroundImage: hasImage ? NetworkImage(room.imageUrl!) : null,
        radius: 25,
        child: !hasImage
            ? Text(
                name.isEmpty ? '' : name[0].toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 22),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    if (_error) {
      return Container();
    }

    if (!_initialized) {
      return Container();
    }

    return StreamBuilder<List<types.Room>>(
      stream: widget.id == null
          ? PersonalizedFirebaseChatCoreRepo.instance.rooms()
          : PersonalizedFirebaseChatCoreRepo.instance.roomsUid(uid: widget.id!),
      initialData: const [],
      builder: (context, snapshot) {
        print(snapshot.data);
        if (!snapshot.hasData) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              bottom: 200,
            ),
            child: const CircularProgressIndicator(
              color: CustomColors.hardPrincipal,
            ),
          );
        }
        if (snapshot.data!.isEmpty) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              bottom: 200,
            ),
            child: const Text(
              'Aun no tienes conversaciones',
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        return GetBuilder<RoomsController>(
            init: _roomsController,
            initState: (_) => _roomsController.init(snapshot.data!),
            builder: (_) {
              if (_.loading) {
                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: CustomColors.hardPrincipal,
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  print(snapshot.data![index]);
                  print(index);
                  final room = snapshot.data![index];
                  si(room);
                  return InkWell(
                    onTap: () {
                      if (widget.id == null) {
                        Get.to(() => ChatPage(
                              room: room,
                            ));
                      } else {
                        Get.to(() => AdminChatPage(
                              room: room,
                              uid: widget.id!,
                            ));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildAvatar(room),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                room.name ?? '',
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 3), Text(
                                      _.messages[index].text,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: _.messages[index].author
                                                      .metadata!["email"].contains("tarotcelestial")
                                              ? Colors.black54
                                              : Colors.red),
                                    )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            });
      },
    );
  }

  si(types.Room room) async {
    types.TextMessage message = await PersonalizedFirebaseChatCoreRepo.instance
        .getLastMessage(room) as types.TextMessage;
  }
}

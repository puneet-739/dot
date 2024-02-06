sealed class HomeBaseEvent {}

class HomePressed extends HomeBaseEvent {}

class ChatPressed extends HomeBaseEvent {}

class GamePressed extends HomeBaseEvent {}

class ProfilePressed extends HomeBaseEvent {}

enum HomeBaseEventEnum {homePressed, chatPressed, gamePressed, profilePressed}

extension HomeBaseEventEnumExtension on HomeBaseEventEnum {
  get event {
    switch(this) {
      case HomeBaseEventEnum.homePressed:
        return HomePressed();
      case HomeBaseEventEnum.chatPressed:
        return ChatPressed();
      case HomeBaseEventEnum.gamePressed:
        return GamePressed();
      case HomeBaseEventEnum.profilePressed:
        return ProfilePressed();
    }
  }
}


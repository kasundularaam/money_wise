import 'dart:math';

import 'package:money_wise/domain/user/user.dart';
import 'package:uuid/uuid.dart';

class Users {
  final List<User> favorites;
  final User currentUser;

  Users(this.favorites, this.currentUser);

  factory Users.init() {
    const uuid = Uuid();
    return Users(
        [
          User(
              id: uuid.v4(),
              name: "olivia",
              imageUrl: "/assets/images/favorites/olivia.png",
              bankName: "Wells Fargo"),
          User(
              id: uuid.v4(),
              name: "emma",
              imageUrl: "/assets/images/favorites/emma.png",
              bankName: "JPMorgan Chase"),
          User(
              id: uuid.v4(),
              name: "ava",
              imageUrl: "/assets/images/favorites/ava.png",
              bankName: "Bank of America"),
          User(
              id: uuid.v4(),
              name: "sophia",
              imageUrl: "/assets/images/favorites/sophia.png",
              bankName: "Citibank"),
          User(
              id: uuid.v4(),
              name: "isabella",
              imageUrl: "/assets/images/favorites/isabella.png",
              bankName: "HSBC"),
          User(
              id: uuid.v4(),
              name: "mia",
              imageUrl: "/assets/images/favorites/mia.png",
              bankName: "Barclays"),
          User(
              id: uuid.v4(),
              name: "amelia",
              imageUrl: "/assets/images/favorites/amelia.png",
              bankName: "Deutsche Bank"),
          User(
              id: uuid.v4(),
              name: "harper",
              imageUrl: "/assets/images/favorites/harper.png",
              bankName: "UBS"),
          User(
              id: uuid.v4(),
              name: "evelyn",
              imageUrl: "/assets/images/favorites/evelyn.png",
              bankName: "Santander"),
          User(
              id: uuid.v4(),
              name: "liam",
              imageUrl: "/assets/images/favorites/liam.png",
              bankName: "Wells Fargo"),
          User(
              id: uuid.v4(),
              name: "noah",
              imageUrl: "/assets/images/favorites/noah.png",
              bankName: "JPMorgan Chase"),
          User(
              id: uuid.v4(),
              name: "oliver",
              imageUrl: "/assets/images/favorites/oliver.png",
              bankName: "Bank of America"),
          User(
              id: uuid.v4(),
              name: "elijah",
              imageUrl: "/assets/images/favorites/elijah.png",
              bankName: "Citibank"),
          User(
              id: uuid.v4(),
              name: "william",
              imageUrl: "/assets/images/favorites/william.png",
              bankName: "HSBC"),
          User(
              id: uuid.v4(),
              name: "james",
              imageUrl: "/assets/images/favorites/james.png",
              bankName: "Barclays"),
          User(
              id: uuid.v4(),
              name: "benjamin",
              imageUrl: "/assets/images/favorites/benjamin.png",
              bankName: "Deutsche Bank"),
          User(
              id: uuid.v4(),
              name: "lucas",
              imageUrl: "/assets/images/favorites/lucas.png",
              bankName: "UBS"),
          User(
              id: uuid.v4(),
              name: "henry",
              imageUrl: "/assets/images/favorites/henry.png",
              bankName: "Santander"),
        ],
        User(
            id: uuid.v4(),
            name: "John Doe",
            imageUrl: "/assets/images/user/user.png",
            bankName: "Standard Chartered"));
  }

  User getRandom() {
    final random = Random();
    return favorites[random.nextInt(favorites.length)];
  }
}

import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookInfoPage extends StatelessWidget {
  const BookInfoPage({Key? key}) : super(key: key);

  static const String routeName = '/bookinfopage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        elevation: 16,
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.save),
                title: Text(
                  'Saved Book',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.history_rounded),
                title: Text(
                  'Hired Book',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Log Out',
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Book Details'),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: const Icon(Icons.save),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
          Builder(
            builder: (context) => GestureDetector(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('images/1.jpg'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15.0),
                  image: const DecorationImage(
                      image: AssetImage('images/1.jpg'), fit: BoxFit.fill),
                ),
              ),
            ),
            ListTile(
              title: const Text('Pother Pachali'),
              subtitle:
                  const Text('Author: Bivutibushon Bondhopaddhoy Category: Fiction'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.star_rate),
                  Text('4.5'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Horihor Ray, an impoverished Brahmin, "
                "lives in the village of Nischindipur. "
                "Indir Thakrun, an old widowed woman, "
                "who had nobody to look after her, "
                "takes shelter in the house of Horihor, "
                "to whom she is distantly related. "
                "Horihor's wife Shorbojoya, an ill-tempered lady, "
                "cannot bear the sight of the old woman. "
                "She is therefore given a tumble-down thatched hut to live in. "
                "However, Durga, Shorbojoya's six-year-old daughter, "
                "is very fond of Indir Thakrun and stays with her "
                "for hours to listen to fairy-tales.After some time,"
                " Shorbojoya gives birth to a son. Shorbojoya is jealous"
                " of Indir Thakrun as she thinks that Durga is more fond "
                "of the old woman than of her mother. Indir Thakrun is "
                "mercilessly turned out of the hut for a trifling reason. "
                "The helpless old woman implores for shelter in her dying "
                "moments but she is heartlessly refused; she passes away in "
                "a rice-barn.Four or five years later, the boy named Apu "
                "grows up to be very inquisitive and sensitive to the beauty "
                "and mystery of nature. He and his elder sister Durga are always "
                "out for some new adventures like roaming through the forests, "
                "taking part in indigenous games and plucking flowers and fruits "
                "stealthily. Apu is admitted into the village school where many "
                "village elders assemble and talk on diverse subjects. Apu is "
                "taken by his father to a client's house. It is the first "
                "time that Apu gets a glimpse of the outside world which "
                "fills his mind with joy and excitement. The village "
                "festivity, the fair, and the Jatra performance, all "
                "bring variety and thrill to the monotonous flow of "
                "village life. Durga, restless yet innocent, dies "
                "suddenly, plunging the whole family into grief and "
                "leaving her little brother all alone. Horihor leaves "
                "home for a long period and struggles desperately to "
                "earn a livelihood. After returning home he decides to "
                "leave Nischindipur. They pack up and go to the railway "
                "station. As the train steams in, they board the train "
                "leaving behind Nischindipur forever with its many sweet and sour memories.",
                textAlign: TextAlign.justify,
              ),
            ),
            Center(
              child: Text(
                'Give Your Rating',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Center(
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Comments',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                color: Colors.grey,
              )),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  size: 40,
                ),
                title: Text("Md. Murad Hossin"),
                subtitle: Text('This is really nice book.'),
              ),
            ),
            const Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                color: Colors.grey,
              )),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  size: 40,
                ),
                title: Text("Md. Shamim"),
                subtitle: Text('Awesome.'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Colors.black,
                maxLines: 10,
                minLines: 8,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    hintText: "Type your comment here...",
                    contentPadding: const EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, top: 8.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

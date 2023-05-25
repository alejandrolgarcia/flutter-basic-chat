
enum Owner { me, yours }

class Message {

  final String text;
  final String? imageUrl;
  final Owner owner;

  Message({
    required this.text, 
    this.imageUrl, 
    required this.owner
  });


}
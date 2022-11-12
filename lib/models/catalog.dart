
class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

 Item({ required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
}

final products = [
  Item(
    id: 1,
    name: "iPhone XR",
    desc: "Apple iPhone XR",
    price: 1000,
    color: "#33505a",
    image: "https://www.apple.com/newsroom/images/product/iphone/standard/iPhone_XR_black-back_09122018_carousel.jpg.large.jpg",
  )
];
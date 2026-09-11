class PrimeMoverEntity {
  final String id;
  final String name;
  final String image;

  static List<PrimeMoverEntity> dummyPrimeMovers = List.generate(
    5,
    (index) =>
        PrimeMoverEntity(id: index.toString(), name: 'Prime Mover', image: ''),
  );
  PrimeMoverEntity({required this.id, required this.name, required this.image});
}

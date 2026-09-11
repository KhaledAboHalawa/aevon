class MuscleGroupIntity {
  final String id;
  final String name;

  static List<MuscleGroupIntity> dummyMuscleGroups = List.generate(
    5,
    (index) =>
        MuscleGroupIntity(id: index.toString(), name: 'Prime Mover '),
  );
  MuscleGroupIntity({required this.id, required this.name});
}

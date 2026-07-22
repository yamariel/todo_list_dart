abstract class Repository <T> {

  void save(T element);
  List<T> showAll();
  T findById(int id);
  void delete(int id);
  void update(T element);
}
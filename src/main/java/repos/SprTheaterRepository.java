package repos;

import models.TheaterModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SprTheaterRepository  extends CrudRepository<TheaterModel,Integer> {
}
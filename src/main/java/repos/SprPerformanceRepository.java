package repos;

import models.PerformanceModel;
import models.TheaterModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SprPerformanceRepository extends CrudRepository<PerformanceModel,Integer> {
}
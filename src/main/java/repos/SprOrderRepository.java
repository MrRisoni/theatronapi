package repos;

import models.OrderModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SprOrderRepository extends CrudRepository<OrderModel,Integer> {
}

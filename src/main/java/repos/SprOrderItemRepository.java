package repos;

import models.OrderItemModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SprOrderItemRepository extends CrudRepository<OrderItemModel,Integer> {
}

package repos;

import models.CardDetailsModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SprCardDetailsRepository extends CrudRepository<CardDetailsModel,Integer> {
}

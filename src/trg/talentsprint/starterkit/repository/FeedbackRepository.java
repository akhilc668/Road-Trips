package trg.talentsprint.starterkit.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Feedback;

@Repository
public interface FeedbackRepository extends CrudRepository<Feedback, Long> {

	
}

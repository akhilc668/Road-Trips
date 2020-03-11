package trg.talentsprint.starterkit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Feedback;
import trg.talentsprint.starterkit.repository.FeedbackRepository;

@Service
public class FeedbackService {
	
	@Autowired
	private FeedbackRepository feedbackRepository;
	
	public void addFeedback(Feedback feedback) {
		feedbackRepository.save(feedback);
	}
	
	
}

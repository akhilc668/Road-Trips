package trg.talentsprint.starterkit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Favourite;
import trg.talentsprint.starterkit.repository.FavouriteRepository;

@Service
public class FavouriteService {
	
	@Autowired
	private FavouriteRepository favourRepository;
	
	public void addFavouriteRoute(Favourite favour) {
		favourRepository.save(favour);
	}
	
	public void deleteFavouriteRoute(long id, String name) {
		long fid = favourRepository.findIdByRidName(id,name);
		favourRepository.deleteById(fid);
	}
	
	public Favourite findFavourite(long rid,String username) {
		return favourRepository.findFavourite(rid, username);
	}

}

package trg.talentsprint.starterkit.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Favourite;

@Repository
public interface FavouriteRepository extends CrudRepository<Favourite, Long> {

	@Query(value = "select id from favourite where rid =?1 and username = ?2", nativeQuery = true)
	long findIdByRidName(long id, String name);
	
	@Query(value = "select * from favourite where rid =?1 and username = ?2", nativeQuery = true)
	Favourite findFavourite(long rid,String username); 
}

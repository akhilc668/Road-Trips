package trg.talentsprint.starterkit.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Route;

@Repository
public interface RouteRepository extends CrudRepository<Route, Long>{

	List<Route> findByUser(String user);
	
	@Query(value = "select * from route where fromaddress=?1 or toaddress=?2 or category=?3", nativeQuery = true)
	List<Route> findByFromToCategory(String from,String to,String category);
	
	@Query(value = "select * from route where id in (select rid from favourite where username = ?1)", nativeQuery = true)
	List<Route> findByfavourite(String name);

	@Query(value = "select * from route where fromaddress=?1", nativeQuery = true)
	List<Route> findByFrom(String from);

	@Modifying
    @Transactional
    @Query(value="update route set rating=?2,comment=?3 where id=?1",nativeQuery = true)
	void addrating(long id, int rating,String comment);

}

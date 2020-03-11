package trg.talentsprint.starterkit.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import trg.talentsprint.starterkit.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    
    @Modifying
    @Transactional
    @Query(value="update user set aboutmyself=?2 , path=?3 where id=?1",nativeQuery = true)
	void updateuser(long id, String aboutmyself,String path);
}

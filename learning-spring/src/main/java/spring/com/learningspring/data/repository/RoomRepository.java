package spring.com.learningspring.data.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import spring.com.learningspring.data.entity.Room;

@Repository
public interface RoomRepository extends CrudRepository<Room,Long> {

}

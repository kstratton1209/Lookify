package com.keara.lookify.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.keara.lookify.models.Lookify;

@Repository
public interface LookifyRepository extends CrudRepository<Lookify, Long> {
	
	List<Lookify> findByArtistContaining(String search);
	
	@Query(value="SELECT * FROM lookify ORDER BY rating DESC LIMIT 10", nativeQuery=true)
	List<Lookify> topTen();
	
	
	
}
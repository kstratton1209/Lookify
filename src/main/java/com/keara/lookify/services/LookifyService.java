package com.keara.lookify.services;

import java.util.List;
import java.util.Optional;


import org.springframework.stereotype.Service;

import com.keara.lookify.models.Lookify;
import com.keara.lookify.repositories.LookifyRepository;

@Service
public class LookifyService {
	
	private final LookifyRepository lookifyRepo;
	
	public LookifyService(LookifyRepository lookifyRepo) {
		this.lookifyRepo = lookifyRepo;
	}
	
	public Lookify create(Lookify l) {
		return lookifyRepo.save(l);
	}
	
	public List<Lookify> getAll() {
		return (List<Lookify>) lookifyRepo.findAll();
	}
	
	public Lookify getOne(Long id) {
		Optional<Lookify> song = lookifyRepo.findById(id);
		if(song.isPresent()) {
			return song.get();
		} else {
			return null;
		}
	}
	
	public Lookify update(Lookify toUpdate, Long id) {
		if(toUpdate.getId() == null) {
			toUpdate.setId(id);
		}
		return lookifyRepo.save(toUpdate);
	}
	
	public void remove(Long id) {
		lookifyRepo.deleteById(id);
	}
	
	public List<Lookify> search(String q) {
		return lookifyRepo.findByArtistContaining(q);
	}
	
	public List<Lookify> topTen() {
		return lookifyRepo.topTen();
	}


	

}

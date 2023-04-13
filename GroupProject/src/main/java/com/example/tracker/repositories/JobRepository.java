package com.example.tracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.tracker.models.Job;

@Repository
public interface JobRepository extends CrudRepository<Job, Long>{
	
	List<Job> findAll();

}

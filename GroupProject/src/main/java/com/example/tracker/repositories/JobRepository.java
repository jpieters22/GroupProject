package com.example.tracker.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.tracker.models.Job;

@Repository
public interface JobRepository extends JpaRepository<Job, Long>{
	
	List<Job> findAll();
	
	@Query("SELECT j FROM Job j WHERE " +
	            "j.position LIKE CONCAT('%',:query, '%')" +
	            "Or j.company LIKE CONCAT('%', :query, '%')")
	List<Job> searchJobs(String query);
	
}

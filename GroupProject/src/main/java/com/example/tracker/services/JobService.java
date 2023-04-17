package com.example.tracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tracker.models.Job;
import com.example.tracker.repositories.JobRepository;

@Service
public class JobService {

	@Autowired
	private JobRepository jobRepository;
	
	public List<Job> allJobs() {
		return jobRepository.findAll();
	}
	
	//find job by id
    public Job findJob(Long id) {
        Optional<Job> optionalJob = jobRepository.findById(id);
        if(optionalJob.isPresent()) {
            return optionalJob.get();
        }else {
            return null;
        }
    }
	
	public Job createItem(Job i) {
		return jobRepository.save(i);
	}
	
	public Job updateJob(Job i) {
		return jobRepository.save(i);
	}
	
	public void deleteOne(Long id) {
		jobRepository.deleteById(id);
	}
}

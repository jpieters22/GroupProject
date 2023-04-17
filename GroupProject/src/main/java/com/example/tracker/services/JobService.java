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
	
	//returns all jobs
	public List<Job>allJobs() {
		return jobRepository.findAll();
	}
	
	//create a job
	public Job createJob(Job job) {
		return jobRepository.save(job);
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
	
	//update a job
	public Job updateJob(Job job) {
		return jobRepository.save(job);
	}
	
	//delete a job
	public void deleteJob(Long id) {
		jobRepository.deleteById(id);
	}
}

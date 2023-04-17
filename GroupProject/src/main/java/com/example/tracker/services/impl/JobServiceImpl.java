package com.example.tracker.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tracker.models.Job;
import com.example.tracker.repositories.JobRepository;
import com.example.tracker.services.JobService;

@Service
public class JobServiceImpl implements JobService {
	
	@Autowired
	private JobRepository jobRepository;
	
	//returns all jobs
	@Override
	public List<Job>allJobs() {
		return jobRepository.findAll();
	}
	
	//create a job
	@Override
	public Job createJob(Job job) {
		return jobRepository.save(job);
	}
	
	//find job by id
	@Override
	public Job findJob(Long id) {
		Optional<Job> optionalJob = jobRepository.findById(id);
		if(optionalJob.isPresent()) {
			return optionalJob.get();
		}else {
			return null;
		}
	}
	
	//update a job
	@Override
	public Job updateJob(Job job) {
		return jobRepository.save(job);
	}
	
	//delete a job
	@Override
	public void deleteJob(Long id) {
		jobRepository.deleteById(id);
	}
	
	@Override
	public List<Job> searchJobs(String query) {
		List<Job> jobs = jobRepository.searchJobs(query);
		return jobs;
	}

}

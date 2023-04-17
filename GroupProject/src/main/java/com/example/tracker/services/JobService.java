package com.example.tracker.services;

import java.util.List;

import com.example.tracker.models.Job;


public interface JobService {
	
	
	//returns all jobs
	public List<Job>allJobs();
	
	//create a job
	public Job createJob(Job job);
	
	//find job by id
	public Job findJob(Long id);
	
	//update a job
	public Job updateJob(Job job);
	
	//delete a job
	public void deleteJob(Long id);
	
	//search for a job
	List<Job> searchJobs(String query);
	
}

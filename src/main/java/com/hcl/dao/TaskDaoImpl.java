package com.hcl.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hcl.exceptions.TaskExceptions;
import com.hcl.model.Task;

@Service
@Transactional
public class TaskDaoImpl {
	@Autowired
	private TaskDao taskDao;

	public List<Task> loadTask() throws TaskExceptions {
		List<Task> tList = new ArrayList<>();
		tList = (List<Task>) taskDao.findAll();
		return tList;
	}

	public boolean CreateNewTask(String taskName, String description, String email, String severe, Date startDate,
			Date endDate) throws TaskExceptions {
		Task t = new Task();
		t.setTaskName(taskName);
		t.setDescription(description);
		t.setEmail(email);
		t.setSevere(severe);
		t.setStartDate(startDate);
		t.setEndDate(endDate);
		try {
			Optional<Task> ex = loadTask().stream().filter(e -> e.getTaskName().equalsIgnoreCase(taskName)).findAny();
			if (ex.isPresent()) {
				System.out.println("same task name exists in db");
				return false;
			}
		} catch (TaskExceptions e) {
			e.getMessage();
		}
		taskDao.save(t);
		return true;
	}

	public void updateTask(Task t) {
		taskDao.delete(t);
		taskDao.save(t);
	}

	public boolean deleteTask(int targetId) {

		Optional<Task> target = taskDao.findById(targetId);
		if (target.isPresent()) {
			// found
			taskDao.deleteById(targetId);
			return true;
		} else {
			return false;
		}
	}

	public Task findTask(int targetId) {
		Optional<Task> t = taskDao.findById(targetId);
		if (t.isPresent()) {
			Task retVal = t.get();
			return retVal;
		} else {
			Task retVal = new Task();
			System.out.println("the task didn't exist");
			return retVal;
		}
	}

}

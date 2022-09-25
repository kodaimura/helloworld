package com.todo.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todo.form.TaskForm;
import com.todo.entity.Task;
import com.todo.mapper.TaskMapper;


@Service
public class TaskService 
{

    @Autowired
    private TaskMapper taskMapper;


    public List<Task> getTasks() {
        return taskMapper.selectAll();
    }


    public Task getTask(Long taskId) {
        return taskMapper.selectById(taskId);
    }


    public void registerTask(TaskForm form) {
        Task task = new Task();
        task.setTaskName(form.getTaskName());
        task.setDescription(form.getDescription());
        task.setDueDate(form.getDueDate());
        task.setPercentage(form.getPercentage());

        taskMapper.insert(task);
        return;
    }


    public void updateTask(TaskForm form, Long taskId) {
        Task task = new Task();
        task.setTaskId(taskId);
        task.setTaskName(form.getTaskName());
        task.setDescription(form.getDescription());
        task.setDueDate(form.getDueDate());
        task.setPercentage(form.getPercentage());

        taskMapper.update(task);
        return;
    }
}
package com.todo.controller;

import java.util.List;
import java.lang.Exception;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.ui.Model;

import com.todo.form.TaskForm;
import com.todo.entity.Task;
import com.todo.service.TaskService;


@Controller
public class TaskController 
{

    @Autowired
    TaskService taskService;


    @GetMapping("/tasks")
    public String getTasks(Model model) {
        List<Task> list = taskService.getTasks();
        model.addAttribute("tasks",list);
        return "tasks";
    }


    @GetMapping("/tasks/new")
    public String newTaskPage(TaskForm taskForm) {
        return "newtask";
    }


    @PostMapping("/tasks")
    public String registerTask(@Validated TaskForm taskFrom, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            System.out.println("registerTask Validation Error: " + bindingResult.getFieldError());
            return "newtask";
        }

        taskService.registerTask(taskFrom);
        return "redirect:tasks";
    }


    @GetMapping("/tasks/{taskId}")
    public String updateTaskPage(@PathVariable Long taskId, Model model) {
        Task task = taskService.getTask(taskId);

        if(task == null) {
            return "redirect:/tasks";
        }

        TaskForm taskForm = new TaskForm();
        taskForm.setTaskName(task.getTaskName());
        taskForm.setDescription(task.getDescription());
        taskForm.setDueDate(task.getDueDate());
        taskForm.setPercentage(task.getPercentage());

        model.addAttribute("taskForm", taskForm);

        return "edittask";
    }


    @PostMapping("/tasks/{taskId}")
    public String updateTask(
        @PathVariable Long taskId, @Validated @ModelAttribute("taskForm") TaskForm taskForm, 
        BindingResult bindingResult, Model model
    ) {
        if(bindingResult.hasErrors()) {
             System.out.println("updateTask Validation Error: " + bindingResult.getFieldError());
             model.addAttribute("message", "更新に失敗しました。");
             return "edittask";
         }
         try {
             taskService.updateTask(taskForm, taskId);
         } catch(Exception ex) {
             model.addAttribute("message", "更新に失敗しました。");
             return "edittask";
         }
         return "redirect:/tasks";
    }

}
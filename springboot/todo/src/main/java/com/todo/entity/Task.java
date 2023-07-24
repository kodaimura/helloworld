package com.todo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.Data;


@Data
@Entity(name = "task")
public class Task 
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "task_id")
    private Long taskId;

    @Column(name = "task_name", nullable = false, length = 100)
    private String taskName;

    @Column(name = "description", nullable = true, length = 500)
    private String description;

    @Column(name = "due_date", nullable = true, length = 50)
    private String dueDate;

    @Column(name = "percentage", nullable = true)
    private Integer percentage;

    @Column(name = "create_at")
    private String createAt;

    @Column(name = "update_at")
    private String updateAt;

}
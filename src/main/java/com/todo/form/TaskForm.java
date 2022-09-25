package com.todo.form;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import lombok.Data;


@Data
public class TaskForm {
    @NotBlank
    @Size(max=100)
    private String taskName;

    @Size(max=500)
    private String description;

    private String dueDate;

    @Max(100)
    @Min(0)
    private Integer percentage;

}
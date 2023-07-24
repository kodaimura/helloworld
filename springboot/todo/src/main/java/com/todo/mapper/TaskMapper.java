package com.todo.mapper;

import com.todo.entity.Task;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;


@Mapper
public interface TaskMapper {
	List<Task> selectAll();
    Task selectById(Long taskId);
    void insert(Task task);
    void update(Task task);
    void deleteById(Long taskId);
}
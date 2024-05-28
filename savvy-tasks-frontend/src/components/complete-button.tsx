"use client";
import UPDATE_TASK from "@/queries/update-task";
import { useMutation } from "@apollo/client";
import { TaskFormProps, TaskI, Task } from "@/interfaces/task.interface";
import React, { useState } from "react";

interface CompleteButtonProps extends TaskFormProps {
  setTask: (task: Task) => void;
}

interface CreateTaskI {
  createTask: CreateTaskResponseI;
}

interface CreateTaskResponseI {
  task: TaskI;
}

const CompleteButton: React.FC<CompleteButtonProps> = (props) => {
  const { task } = props;
  const { completed } = task;
  const [isCompleted, setIsCompleted] = useState(completed);

  const cleanTask: Task = (task: Task) => Task {
    task.delete(__typename);
    return task;
  };

  const [updateTask, { data, loading, error }] = useMutation<CreateTaskI>(
    UPDATE_TASK,
    {
      variables: { input: { taskInput: cleanTask(task) } },
      onCompleted: (data) => {
        props.setTask(data.createTask.task);
      },
    }
  );

  if (error) {
    console.log(error.message);
  }
  return (
    <form
      className={`grid px-6 col-span-9 py-3 flex-shrink-0`}
      onSubmit={(e) => {
        e.preventDefault();
        console.log(isCompleted);
        setIsCompleted(!isCompleted);
        console.log(isCompleted);
        updateTask();
      }}
    >
      <button
        className={`${
          isCompleted ? "bg-green-600 hover:bg-red-600" : "bg-red-600"
        } py-3 mb-2 col-span-9 flex-shrink-0`}
        disabled={loading}
        type="submit"
      >
        {loading
          ? "Loading..."
          : isCompleted
          ? "Completed Task!"
          : "Task Not Complete!"}
      </button>
    </form>
  );
};

export default CompleteButton;

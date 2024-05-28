"use client";
import UPDATE_TASK, { UpdateTaskI } from "@/queries/update-task";
import { useMutation } from "@apollo/client";
import { TaskFormProps, Task } from "@/interfaces/task.interface";
import React, { useState, useEffect } from "react";

interface CompleteButtonProps extends TaskFormProps {
  setTask: (task: Task) => void;
}

const CompleteButton: React.FC<CompleteButtonProps> = (props) => {
  const { task } = props;
  const { completed } = task;
  const [isCompleted, setIsCompleted] = useState(completed);

  const [updateTask, { data, loading, error }] = useMutation<UpdateTaskI>(
    UPDATE_TASK,
    {
      variables: { input: { taskInput: task } },
      onCompleted: (data) => {
        props.setTask(data.updateTask.task);
      },
    }
  );

  useEffect(() => {
    updateTask();
  }, [isCompleted, updateTask]);

  if (error) {
    console.log(error.message);
  }

  const newCompleted = !isCompleted;

  return (
    <form
      className={`grid px-6 col-span-9 py-3 flex-shrink-0`}
      onSubmit={(e) => {
        e.preventDefault();
        task.completed = newCompleted;
        setIsCompleted(newCompleted);
      }}
    >
      <button
        className={`${
          isCompleted
            ? "bg-green-600 hover:bg-green-800"
            : "bg-red-600 hover:bg-red-800"
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

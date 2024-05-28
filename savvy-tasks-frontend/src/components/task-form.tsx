"use client";

import React, { useState, FormEvent } from "react";
import { TaskFormProps } from "@/interfaces/task.interface";
import DeleteButton from "./delete-button";
import SaveButton from "./save-button";
import CompleteButton from "./complete-button";

const TaskForm: React.FC<TaskFormProps> = (props) => {
  const [isDirty, setIsDirty] = useState(false);
  const [task, setTask] = useState(props.task);

  const handleChange = (e: FormEvent) => {
    e.preventDefault();
    const { name, value } = e.target as HTMLInputElement;
    Object.assign(task, { [name]: value });
    setIsDirty(true);
  };

  return (
    <div className="grid-col-9 mx-auto grid max-w-lg content-center justify-items-stretch items-centergap-2 bg-black">
      <div className="col-span-9 grid-cols-subgrid grid bg-black">
        <label className="col-span-3 mb-4 bg-black" htmlFor="title">
          Title
        </label>
        <input
          required
          className="col-span-6 mb-4 border border-0 border-b-2 bg-black"
          type="text"
          name="title"
          defaultValue={task.title}
          onChange={handleChange}
        />
        <label className="col-span-3 mb-3" htmlFor="dueDate">
          Due Date
        </label>
        <input
          className="col-span-6 mb-3 text-white dark border border-0 border-b-2 dark:bg-gray-700"
          type="datetime-local"
          name="dueDate"
          // value={task.dueDate?.forDisplay()}
          value={""}
          onChange={handleChange}
        />
        <label className="col-span-9 bg-black mb-2" htmlFor="description">
          Description
        </label>
        <textarea
          required
          className="bg-black border-white border col-span-9 bg-black p-4 border rounded-md"
          name="description"
          defaultValue={task.description}
          onChange={handleChange}
        />
        <SaveButton isDirty={isDirty} setTask={setTask} task={task} />
      </div>

      <CompleteButton task={task} setTask={setTask} />
      <DeleteButton task={task} />
    </div>
  );
};

export default TaskForm;

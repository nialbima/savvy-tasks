"use client";
import React, { createContext, useContext, useState, FormEvent } from "react";

import { useMutation } from "@apollo/client";
import { useSuspenseQuery } from "@apollo/experimental-nextjs-app-support/ssr";
import UPDATE_TASK from "@/queries/update-task";
import CREATE_TASK from "@/queries/create-task";
import DELETE_TASK from "@/queries/delete-task";
import TaskInterface from "@/interfaces/task.interface";
import { DueDate } from "@/interfaces/timestamp.interface";

export default function Page() {
  const [isLoading, setIsLoading] = useState(false);
  const task: TaskInterface = {
    id: "",
    title: "",
    dueDate: new DueDate(),
    description: "",
    completed: false,
  };

  const clickWrapper = (fn: Function) => (e: FormEvent) => {
    e.preventDefault();
    fn();
  };

  const [createTask] = useMutation(CREATE_TASK, {
    variables: task,
    onCompleted: (data) => {
      console.log(data);
    },
  });

  const [deleteTask] = useMutation(DELETE_TASK, {
    variables: task,
    onCompleted: (data) => {
      console.log(data);
    },
  });

  const [updateTask] = useMutation(UPDATE_TASK, {
    variables: task,
    onCompleted: (data) => {
      console.log(data);
    },
  });

  return (
    <div className="grid-col-9 mx-auto grid max-w-lg content-center justify-items-stretch items-centergap-2 bg-black">
      <form className="col-span-9 grid-cols-subgrid grid bg-black">
        <label className="col-span-3 mb-4 bg-black" htmlFor="title">
          Title
        </label>
        <input
          className="col-span-6 mb-4 border border-0 border-b-2 bg-black"
          type="text"
          name="title"
          defaultValue={task.title}
        />
        <label className="col-span-3 mb-3" htmlFor="dueDate">
          Due Date
        </label>
        <input
          className="col-span-6 mb-3 text-white dark border border-0 border-b-2 dark:bg-gray-700"
          type="datetime-local"
          name="dueDate"
          defaultValue={task.dueDate?.forDisplay()}
        />
        <label className="col-span-9 bg-black mb-2" htmlFor="description">
          Description
        </label>
        <textarea
          className="bg-black border-white border col-span-9 bg-black p-4 border rounded-md"
          name="description"
          defaultValue={task.description}
        />
        <button
          className="bg-cyan-500 px-12 py-3 mt-4 mb-2 col-span-9"
          type="submit"
          disabled={isLoading}
          onClick={clickWrapper(createTask)}
        >
          {isLoading ? "Loading..." : "Save"}
        </button>
      </form>
      <button
        className="bg-green-500 px-12 py-3 mb-2 col-span-9"
        onClick={clickWrapper(updateTask)}
      >
        Complete!
      </button>
      <button
        className="bg-red-600 px-12 py-3 mb-2 col-span-9 flex-shrink-0 "
        onClick={clickWrapper(deleteTask)}
      >
        Delete!
      </button>
    </div>
  );
}

import React from "react";
import TaskForm from "@/components/task-form";
import { Task } from "@/interfaces/task.interface";

const Page: React.FC = () => {
  const task: Task = {
    title: "",
    description: "",
    completed: false,
    dueDate: undefined,
  };

  return (
    <div>
      <TaskForm task={task} />;
    </div>
  );
};

export default Page;

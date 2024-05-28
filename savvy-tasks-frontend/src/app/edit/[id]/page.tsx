"use client";

import TaskForm from "@/components/task-form";
import { Task, TaskData } from "@/interfaces/task.interface";
import { useSuspenseQuery } from "@apollo/client";
import GET_TASK from "@/queries/get-task";

function Page({ params }: { params: { id: string } }) {
  const { data } = useSuspenseQuery(GET_TASK, {
    variables: { id: params.id },
  });

  console.log(data);
  const taskData: TaskData = data;
  console.log(taskData.task);
  return <TaskForm task={taskData.task} />;
}

export default Page;

"use client";

import TaskForm from "@/components/task-form";
import { TaskData, Task } from "@/interfaces/task.interface";
import { useSuspenseQuery } from "@apollo/client";
import GET_TASK from "@/queries/get-task";

function Page({ params }: { params: { gid: string } }) {
  const { data } = useSuspenseQuery(GET_TASK, {
    variables: { gid: params.gid },
  });

  const taskData: TaskData = data;
  const task: Task = taskData.task;
  return <TaskForm task={task} />;
}

export default Page;

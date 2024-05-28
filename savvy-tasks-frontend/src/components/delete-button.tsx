"use client";

import DELETE_TASK, { DeleteTaskI } from "@/queries/delete-task";
import GET_USER_TASKS from "@/queries/get-user-tasks";
import { useMutation } from "@apollo/client";
import { TaskFormProps } from "@/interfaces/task.interface";
import { useRouter } from "next/navigation";

const DeleteButton: React.FC<TaskFormProps> = (props) => {
  const router = useRouter();
  const [deleteTask, { data, loading, error }] = useMutation<DeleteTaskI>(
    DELETE_TASK,
    {
      variables: { input: { taskInput: props.task } },
      onCompleted: (_data) => {
        router.push("/tasks");
      },
    }
  );

  if (error) {
    console.log(error.message);
  }

  return (
    <form
      className="grid px-6 py-3 mb-2 col-span-9 flex-shrink-0 "
      onSubmit={(e) => {
        e.preventDefault();
        deleteTask();
      }}
    >
      <button
        className="bg-red-600 hover:bg-red-800 py-3 mb-2 col-span-9 flex-shrink-0"
        type="submit"
      >
        Delete!
      </button>
    </form>
  );
};

export default DeleteButton;

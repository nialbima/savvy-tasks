"use client";
import DELETE_TASK from "@/queries/delete-task";
import { useMutation } from "@apollo/client";
import { TaskI, TaskFormProps } from "@/interfaces/task.interface";

const DeleteButton: React.FC<TaskFormProps> = (props) => {
  const [deleteTask, { data, loading, error }] = useMutation<TaskI>(
    DELETE_TASK,
    {
      variables: { task: props.task },
      onCompleted: (data) => {
        console.log(data);
      },
    }
  );
  return (
    <form
      className="grid px-6 py-3 mb-2 col-span-9 flex-shrink-0 "
      onSubmit={(e) => {
        e.preventDefault();
        deleteTask();
      }}
    >
      <button
        className="bg-red-600 py-3 mb-2 col-span-9 flex-shrink-0"
        type="submit"
      >
        Delete!
      </button>
    </form>
  );
};

export default DeleteButton;

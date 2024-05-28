"use client";
import CREATE_TASK from "@/queries/create-task";
import { useMutation } from "@apollo/client";
import { TaskI, Task, TaskFormProps } from "@/interfaces/task.interface";
import UPDATE_TASK from "@/queries/update-task";

interface SaveButtonProps extends TaskFormProps {
  isDirty: boolean;
  setTask: (task: Task) => void;
}

interface CreateTaskI {
  createTask: CreateTaskResponseI;
}

interface CreateTaskResponseI {
  task: TaskI;
}

interface UpdateTaskI {
  updateTask: UpdateTaskResponseI;
}

interface UpdateTaskResponseI {
  task: TaskI;
}

type CreateOrUpdateMutation = CreateTaskI & UpdateTaskI;

const SaveButton: React.FC<SaveButtonProps> = (props) => {
  const { task, isDirty } = props;

  const queryConstant = () => {
    return task.id ? UPDATE_TASK : CREATE_TASK;
  };

  const [createOrUpdateTask, { data, loading, error }] =
    useMutation<CreateOrUpdateMutation>(queryConstant(), {
      variables: { input: { taskInput: task } },
      onCompleted: (data) => {
        if (!task.id) {
          task.id = data.createTask.task.id;
        }
      },
    });

  if (error) {
    console.log(error.message);
  }

  return (
    <form
      className="grid col-span-9 mt-3 px-6 py-4 flex-shrink-0 "
      onSubmit={(e) => {
        e.preventDefault();
        createOrUpdateTask();
      }}
    >
      <button
        className={`${
          isDirty ? "bg-cyan-500 hover:bg-cyan-700" : "bg-gray-700"
        } bg-cyan-500 py-3 mb-2 col-span-9 flex-shrink-0`}
        disabled={loading || !isDirty}
        type="submit"
      >
        {loading ? "Loading..." : "Save"}
      </button>
    </form>
  );
};

export default SaveButton;

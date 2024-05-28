import { gql } from "@apollo/client";
import { TaskI } from "@/interfaces/task.interface";
export interface UpdateTaskI {
  updateTask: UpdateTaskResponseI;
}

export interface UpdateTaskResponseI {
  task: TaskI;
}

const UPDATE_TASK = gql`
  mutation UpdateTask($input: UpdateTaskInput!, $id:) {
    updateTask(input: $input) {
      task {
        id
        title
        description
        completed
        dueDate
      }
    }
  }
`;

export default UPDATE_TASK;

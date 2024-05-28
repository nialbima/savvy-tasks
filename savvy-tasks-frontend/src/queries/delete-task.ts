import { gql } from "@apollo/client";
import { TaskI } from "@/interfaces/task.interface";

export interface DeleteTaskI {
  DeleteTask: DeleteTaskResponseI;
}

export interface DeleteTaskResponseI {
  task: TaskI;
}
const DELETE_TASK = gql`
  mutation DeleteTask($input: DeleteTaskInput!) {
    deleteTask(input: $input) {
      task {
        gid
        title
        discardedAt
      }
    }
  }
`;

export default DELETE_TASK;

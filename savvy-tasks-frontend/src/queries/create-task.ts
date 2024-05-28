import { gql } from "@apollo/client";

const CREATE_TASK = gql`
  mutation CreateTask($input: CreateTaskInput!) {
    createTask(input: $input) {
      task {
        gid
        title
        description
        dueDate
      }
    }
  }
`;

export default CREATE_TASK;

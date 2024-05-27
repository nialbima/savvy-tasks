import { gql } from "@apollo/client";

const CREATE_TASK = gql`
  mutation CreateTask($input: CreateTaskInput!) {
    createTask(input: $input) {
      task {
        id
        title
        description
        dueDate
      }
    }
  }
`;

export default CREATE_TASK;

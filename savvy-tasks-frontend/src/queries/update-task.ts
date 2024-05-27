import { gql } from "@apollo/client";

const UPDATE_TASK = gql`
  mutation UpdateTask($input: UpdateTaskInput!) {
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

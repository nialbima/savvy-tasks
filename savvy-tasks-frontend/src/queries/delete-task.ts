import { gql } from "@apollo/client";

const DELETE_TASK = gql`
  mutation DeleteTask($input: DeleteTaskInput!) {
    deleteTask(input: $input) {
      task {
        id
        title
        discardedAt
      }
    }
  }
`;

export default DELETE_TASK;

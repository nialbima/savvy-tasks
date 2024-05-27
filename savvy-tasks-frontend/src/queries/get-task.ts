import { gql } from "@apollo/client";

const GET_TASK = gql`
  query GetTask($id: ID!) {
    task(id: $id) {
      id
      title
      description
      dueDate
      completed
      discardedAt
    }
  }
`;

export default GET_TASK;

import { gql } from "@apollo/client";
import type { TypedDocumentNode } from "@apollo/client";
import { TaskData } from "@/interfaces/task.interface";

interface Variables {
  id: string;
}

const GET_TASK: TypedDocumentNode<TaskData, Variables> = gql`
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

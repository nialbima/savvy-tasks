import { gql } from "@apollo/client";
import type { TypedDocumentNode } from "@apollo/client";
import { TaskData } from "@/interfaces/task.interface";

interface Variables {
  gid: string;
}

const GET_TASK: TypedDocumentNode<TaskData, Variables> = gql`
  query GetTask($gid: ID!) {
    task(gid: $gid) {
      gid
      title
      description
      dueDate
      completed
      discardedAt
    }
  }
`;

export default GET_TASK;

import { gql } from "@apollo/client";

// This supports pagination in the API, but I'm not implementing that here. Right now, it loads
// all the tasks into a list in the server, and performance isn't a concern.
const GET_USER_TASKS = gql`
  query GetUserTasks(
    $id: ID!
    $startCursor: String
    $endCursor: String
    $pageSize: Int
  ) {
    user(id: $id) {
      id
      activeTasksCount
      tasks(first: $pageSize, after: $endCursor, before: $startCursor) {
        edges {
          cursor
          node {
            id
            title
            description
            completed
            dueDate
          }
        }
        pageInfo {
          hasNextPage
          hasPreviousPage
          startCursor
          endCursor
        }
      }
    }
  }
`;

export default GET_USER_TASKS;

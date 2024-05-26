import { getClient } from "../../utils/apollo";
import Table from "./table";
import { gql } from "@apollo/client";
// definitely doesn't belong here, this is just to check for comms
const GET_USER_TASKS = gql`
  query HydrateUserData(
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

async function IndexPage() {
  const id = process.env.STATIC_USER_GID;
  const { data } = await getClient().query({
    query: GET_USER_TASKS,
    variables: { id },
  });
  console.log(typeof data);
  return <Table data={data} />; // Use the 'Table' component as a JSX element
}

export default IndexPage;

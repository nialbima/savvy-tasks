import { getClient } from "../../utils/apollo";
import Table from "./table";
import GET_USER_TASKS from "@/queries/get-user-tasks";

async function Page() {
  const id = process.env.STATIC_USER_GID;
  const { data } = await getClient().query({
    query: GET_USER_TASKS,
    variables: { id },
  });
  return <Table data={data} />;
}

export default Page;

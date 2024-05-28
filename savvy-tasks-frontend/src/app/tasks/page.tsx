import { getClient } from "../../utils/apollo";
import Table from "../../components/table";
import GET_USER_TASKS from "@/queries/get-user-tasks";
import { revalidatePath } from "next/cache";

async function Page() {
  const gid = process.env.NEXT_PUBLIC_STATIC_USER_GID;
  const { data } = await getClient().query({
    query: GET_USER_TASKS,
    variables: { gid },
  });
  return <Table data={data} />;
}

export default Page;

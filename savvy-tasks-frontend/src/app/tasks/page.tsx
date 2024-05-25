import { getClient } from "../../utils/apollo";

// definitely doesn't belong here, this is just to check for comms
async function canIGetData() {
  // const { data } = await getClient().query({});
  return "";
}

export default function IndexPage() {
  return <Table />;
  // <h1>Hello, Tasks Page! {canIGetData()} </h1>;
}

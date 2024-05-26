import Row from "./row";

function Table({ data }: { data: any }) {
  const {
    user: {
      tasks: { edges },
    },
  } = data;
  console.log(typeof edges[0]);
  return (
    <div>
      {edges.map((edge: object) => (
        <Row task={edge.node} />
      ))}
    </div>
  );
  return <div>hi</div>;
}

export default Table;

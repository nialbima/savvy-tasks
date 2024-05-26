import Row from "./row";
import Task from "../../shared/interfaces/task.interface";

type Edge = {
  node: Task;
  cursor: string;
};

function Table({ data }: { data: any }) {
  const {
    user: {
      tasks: { edges },
    },
  } = data;
  return (
    <div>
      {edges.map((edge: Edge) => (
        <Row task={edge.node} />
      ))}
    </div>
  );
  return <div>hi</div>;
}

export default Table;

"use client";

import Row from "@/components/table/row";
import ColumnHeaders from "@/components/table/column-headers";
import { Task } from "../interfaces/task.interface";

type Edge = {
  node: Task;
  cursor: string;
};

function Table({ data }: { data: any }): React.JSX.Element {
  const {
    user: {
      tasks: { edges },
    },
  } = data;

  if (edges.length === 0) {
    return <div>No tasks found!</div>;
  }

  const cssClasses =
    "bg-black content-center divide-gray-300/50 divide-y first:gap-y-0 gap-2 grid grid-col-9 items-center justify-items-center max-w-lg mx-auto";

  return (
    <div className={cssClasses}>
      <ColumnHeaders />
      {edges.map((edge: Edge) => (
        <Row task={new Task(edge.node)} key={edge.node.gid} />
      ))}
    </div>
  );
}

export default Table;
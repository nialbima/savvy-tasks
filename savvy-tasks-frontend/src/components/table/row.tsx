"use client";

import React from "react";
import Link from "next/link";
import { Task } from "../../interfaces/task.interface";

function Row({ task }: { task: Task }): React.JSX.Element {
  return (
    <Link
      href={`/edit/${task.gid}`}
      className="grid grid-cols-subgrid py-3 col-span-9"
    >
      <div className="col-span-5">{task.title}</div>
      <div>{task.dueDate?.forIndex() || "N/A"}</div>
      <div className="col-span-1 text-center">
        {task.completed ? "✅" : "❌"}
      </div>
    </Link>
  );
}

export default Row;

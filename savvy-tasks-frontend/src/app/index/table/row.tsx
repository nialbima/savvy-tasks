import Task from "../../../shared/interfaces/task.interface";

function Row({ task }: { task: Task }): React.JSX.Element {
  return (
    <div className="grid grid-cols-subgrid py-3 col-span-9">
      <div className="col-span-5">{task.title}</div>
      {/* <div>{task.dueDate?.forDisplay() || "N/A"}</div> */}
      <div className="col-span-3">{"Date"}</div>
      <div className="col-span-1 text-center">
        <input checked={task.completed} type="checkbox"></input>
      </div>
    </div>
  );
}

export default Row;

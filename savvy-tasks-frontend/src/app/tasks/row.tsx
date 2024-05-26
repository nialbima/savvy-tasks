import Task from "../../shared/interfaces/task.interface";

function Row({ task }: { task: Task }): React.JSX.Element {
  return (
    <div>
      <div>{task.title}</div>
      <div>{task.description}</div>
      <div>{task.completed}</div>
      <div>{task.dueDate}</div>
    </div>
  );
}

export default Row;

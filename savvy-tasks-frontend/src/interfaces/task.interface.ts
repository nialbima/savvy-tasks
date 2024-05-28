import { Timestamp, DueDate } from "./timestamp.interface";

export interface TaskI {
  gid?: string;
  title: string;
  description: string;
  completed: boolean;
  dueDate?: DueDate;
}

export class Task implements TaskI {
  gid?: string;
  title: string;
  description: string;
  completed: boolean;
  dueDate?: DueDate;
  discardedAt?: Timestamp;

  constructor({ gid, title, description, completed, dueDate }: TaskI) {
    this.gid = gid;
    this.title = title;
    this.description = description;
    this.completed = completed;
    this.dueDate = dueDate ? new DueDate(dueDate) : undefined;
  }
}

export interface TaskData {
  task: Task;
}

export interface TaskFormProps {
  task: Task;
}

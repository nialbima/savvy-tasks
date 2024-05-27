import { Timestamp, DueDate } from "./timestamp.interface";

interface TaskInterface {
  id: string;
  title: string;
  description: string;
  completed: boolean;
  dueDate?: DueDate;
  createdAt: Timestamp;
  updatedAt: Timestamp;
}

class Task implements TaskInterface {
  id: string;
  title: string;
  description: string;
  completed: boolean;
  dueDate?: DueDate;
  createdAt: Timestamp;
  updatedAt: Timestamp;

  constructor({
    id,
    title,
    description,
    completed,
    dueDate,
    createdAt,
    updatedAt,
  }: TaskInterface) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.completed = completed;
    this.dueDate = dueDate;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }
}

export default Task;

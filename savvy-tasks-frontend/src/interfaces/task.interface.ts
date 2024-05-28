import { Timestamp, DueDate } from "./timestamp.interface";

export interface TaskI {
  id?: string;
  title: string;
  description: string;
  completed: boolean;
  dueDate?: DueDate;
  createdAt?: Timestamp;
  updatedAt?: Timestamp;
}

export class Task implements TaskI {
  id?: string;
  title: string;
  description: string;
  completed: boolean;
  dueDate?: DueDate;
  createdAt?: Timestamp;
  updatedAt?: Timestamp;

  constructor({
    id,
    title,
    description,
    completed,
    dueDate,
    createdAt,
    updatedAt,
  }: TaskI) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.completed = completed;
    this.dueDate = dueDate;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }
}

export interface TaskData {
  task: Task;
}

export interface TaskFormProps {
  task: Task;
}

interface TaskInterface {
  id: string;
  title: string;
  description: string;
  completed: boolean;
  dueDate: Date;
  createdAt: Date;
  updatedAt: Date;
}

class Task implements TaskInterface {
  id: string;
  title: string;
  description: string;
  completed: boolean;
  dueDate: Date;
  createdAt: Date;
  updatedAt: Date;

  constructor(
    id: string,
    title: string,
    description: string,
    completed: boolean,
    dueDate: Date,
    createdAt: Date,
    updatedAt: Date
  ) {
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

interface TimestampInterface extends Date {
  forDisplay(): string;
}

interface DueDateInterface extends Timestamp {
  pastDue(): boolean;
}

export class Timestamp extends Date implements TimestampInterface {
  forDisplay(): string {
    return this.toLocaleString();
  }
}

export class DueDate extends Date implements DueDateInterface {
  forDisplay(): string {
    return this.toLocaleString();
  }

  pastDue(): boolean {
    return this < new Date();
  }
}

export default Timestamp;

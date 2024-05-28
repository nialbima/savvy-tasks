interface TimestampI extends Date {
  forDisplay(): string;
}

interface DueDateI extends Timestamp {
  pastDue(): boolean;
}

export class Timestamp extends Date implements TimestampI {
  forDisplay(): string {
    return this.toLocaleString();
  }
}

export class DueDate extends Date implements DueDateI {
  forDisplay(): string {
    this.setUTCHours(0, 0, 0, 0);
    return this.toISOString();
  }

  pastDue(): boolean {
    return this < new Date();
  }
}

export default Timestamp;

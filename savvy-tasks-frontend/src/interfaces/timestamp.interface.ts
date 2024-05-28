interface TimestampI extends Date {
  forDisplay(): string;
}

interface DueDateI extends Date {
  forIndex(): string;
}

export class Timestamp extends Date implements TimestampI {
  forDisplay(): string {
    return this.toLocaleString();
  }
}

export class DueDate extends Date implements DueDateI {
  forIndex(): string {
    return new Date(this).toLocaleDateString("en-us", {
      weekday: "short",
      year: "numeric",
      month: "numeric",
      day: "numeric",
    });
  }

  forFormControl(): string {
    // This is a VERY, VERY simplistic approach to getting an iso8601 string in the right format
    // for the datepicker form control. This only works because everything is in UTC time.
    let isoString = this.toISOString();
    return isoString.substring(0, isoString.length - 1);
  }
}

export default Timestamp;

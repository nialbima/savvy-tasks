import Link from "next/link";

export default function Nav() {
  return (
    <section>
      <nav>
        <Link href="/tasks">Tasks</Link>
        <Link href="/form">Add A Task</Link>
      </nav>
    </section>
  );
}

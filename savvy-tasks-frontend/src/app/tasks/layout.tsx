import Link from "next/link";

export default function TasksLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <section>
      <nav>
        <Link href="/tasks">Tasks</Link>
        <Link href="/form">Add A Task</Link>
      </nav>

      {children}
    </section>
  );
}

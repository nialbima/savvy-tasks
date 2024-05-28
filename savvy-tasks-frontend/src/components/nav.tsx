import Link from "next/link";

export default function Nav() {
  return (
    <div className="sticky top-0 py-3 bg-black">
      <h1 className="text-center text-4xl pb-2 subpixel-antialiased italic font-black tracking-widest ">
        SAVVY TASKS
      </h1>
      <nav className="bg-black py-2 grid grid-cols-2 gap-4 place-items-stretch">
        <Link
          className="py-1 text-center ring-1 rounded-sm ring-gray-400 shadow-xl  shadow-stone-500/20 bg-gray-900"
          href="/tasks"
        >
          Tasks
        </Link>
        <Link
          className="py-1 text-center ring-1 rounded-sm ring-gray-400 shadow-xl  shadow-stone-500/20 bg-gray-900"
          href="/create"
        >
          Add A Task
        </Link>
      </nav>
    </div>
  );
}

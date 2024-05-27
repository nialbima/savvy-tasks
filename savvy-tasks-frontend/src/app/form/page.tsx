"use client";
import React, { createContext, useContext, useState, FormEvent } from "react";

import { useSuspenseQuery } from "@apollo/experimental-nextjs-app-support/ssr";
import GET_USER_TASKS from "@/queries/get-user-tasks";
import UPDATE_TASK from "@/queries/update-task";
import CREATE_TASK from "@/queries/create-task";
import DELETE_TASK from "@/queries/delete-task";

export default function Page() {
  const id = process.env.STATIC_USER_GID;
  // const { data } = useSuspenseQuery(GET_USER_TASKS, { variables: { id } });
  // console.log(data);
  return "oops";
}

// const [isLoading, setIsLoading] = useState<boolean>(false);
// const [error, setError] = useState<string | null>(null);

// async function onDelete() {}
// async function onSubmit(event: FormEvent<HTMLFormElement>) {
//   event.preventDefault();

// const formData = new FormData(event.currentTarget);
// // const response = await fetch("/api/submit", {
// //   method: "POST",
// //   body: formData,
// // });

// // Handle response if necessary
// const data = await response.json();
// // ...
// }

// return (
//   <div class="dark grid-col-9 mx-auto grid max-w-lg content-center items-center justify-items-center gap-2 divide-y divide-gray-300/50 bg-black first:gap-y-0">
//     <form
//       class="col-span-9 grid-cols-subgrid grid bg-black"
//       onSubmit="{onSubmit}"
//     >
//       <label class="col-span-3 bg-black" htmlFor="title">
//         Title
//       </label>
//       <input
//         class="col-span-6 border border-0 border-b-2 bg-black"
//         type="text"
//         name="title"
//       />
//       <label class="col-span-3" htmlFor="dueDate">
//         Due Date
//       </label>
//       <input
//         class="col-span-6 text-white dark:bg-black"
//         type="datetime-local"
//         name="dueDate"
//       />
//       <label class="col-span-9 bg-black" htmlFor="description">
//         Description
//       </label>
//       <textarea
//         class="col-span-9 bg-black p-4 border rounded-md "
//         rows="5"
//         columns="30"
//         class="bg-black border-white border"
//         name="description"
//       ></textarea>
//       <label class="col-span-3" htmlFor="completed">
//         Completed?
//       </label>
//       <input class="col-span-4" type="checkbox" name="completed" />
//       <button type="submit" disabled="{isLoading}">
//         {isLoading ? "Loading..." : "Save"}
//       </button>
//     </form>
//     <form onSubmit="{onDelete}">
//       <button>Delete This</button>
//     </form>
//   </div>
// );
// }

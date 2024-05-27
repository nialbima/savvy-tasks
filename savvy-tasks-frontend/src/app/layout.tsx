import type { Metadata } from "next";
import Nav from "@/components/nav";
import { Inter } from "next/font/google";
import { ApolloWrapper } from "../components/apollo-wrapper";
import "./globals.css";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Savvy Tasks",
  description: "A really simple",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="dark">
      <body className={inter.className}>
        <div className="relative flex min-h-screen flex-col justify-center overflow-py-6 md:py-0 sm:py-12">
          <div className="relative px-6 pb-8 pt-10 shadow-xl ring-1 ring-gray-400 sm:mx-auto sm:max-w-6xl sm:rounded-lg sm:px-10">
            <ApolloWrapper>
              <Nav />
              {children}
            </ApolloWrapper>
          </div>
        </div>
      </body>
    </html>
  );
}

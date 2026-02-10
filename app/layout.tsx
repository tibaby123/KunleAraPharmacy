import '<style>./globals.css</style>'


export const metadata = {
  title: 'Kunle Ara Pharmacy',
  description: 'Multi-branch pharmacy system with POS integration',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>
        <header className="bg-blue-600 text-white p-4">
          <h1 className="text-2xl font-bold">Kunle Ara Pharmacy</h1>
          <nav className="mt-2">
            <span className="mr-4">UCH Branch</span>
            <span className="mr-4">Yemetu Branch</span>
            <span className="mr-4">Ring Road Branch</span>
          </nav>
        </header>
        <main className="container mx-auto p-4">
          {children}
        </main>
      </body>
    </html>
  )
}

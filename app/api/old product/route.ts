import { supabase } from '@/lib/supabaseServer'

export async function GET() {
  const { data, error } = await supabase
    .from('Product')
    .select('*')

  if (error) {
    console.error('SUPABASE ERROR:', error)
    return Response.json(
      { error: error.message },
      { status: 500 }
    )
  }

  return Response.json(data)
}


import Image from 'next/image'

interface LogoProps {
  className?: string
  size?: 'sm' | 'md' | 'lg'
}

export default function Logo({ className = '', size = 'md' }: LogoProps) {
  const sizes = {
    sm: { width: 80, height: 30 },
    md: { width: 120, height: 40 },
    lg: { width: 180, height: 60 }
  }

  return (
    <Image
      src="/logo.jpg"
      alt="Kunle Ara Pharmacy"
      width={sizes[size].width}
      height={sizes[size].height}
      className={`h-auto w-auto ${className}`}
      priority
    />
  )
}

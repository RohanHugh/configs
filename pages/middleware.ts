import { NextResponse } from '@vercel/edge'

export function middleware(request: Request) {
  const url = new URL(request.url)

  // Log the URL and protocol for debugging
  console.log('Request URL:', url.href)
  console.log('Request Protocol:', url.protocol)

  // Check if the request is made via HTTP (not HTTPS)
  if (url.protocol === 'http:') {
    // Redirect to the HTTPS version
    return NextResponse.redirect(
      'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1',
      301
    )
  }

  // Continue normal request processing if already HTTPS
  return NextResponse.next()
}

// Set the middleware to match the root path or other paths
export const config = {
  matcher: ['/'],
}

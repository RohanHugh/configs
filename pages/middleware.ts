import { NextResponse } from 'next/server';
import { NextRequest } from 'next/server';

export function middleware(req: NextRequest) {
  const host = req.headers.get('host');

  // Define the target URL to redirect to
  const redirectUrl = 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1';

  // Check if the request is from the specific subdomain
  if (host === 'setup.202583.xyz') {
    // Redirect with a 301 status code
    return NextResponse.redirect(redirectUrl, 301);
  }

  // Continue with the request if the subdomain doesn't match
  return NextResponse.next();
}

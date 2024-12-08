import { NextResponse } from 'next/server';

export default function middleware(request) {
  const url = request.nextUrl;
  const hostname = request.headers.get('host');

  // Only redirect for setup.202583.xyz
  if (hostname === 'setup.202583.xyz') {
    return NextResponse.redirect('https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1', 301);
  }

  // Allow other domains/subdomains to proceed as normal
  return NextResponse.next();
}

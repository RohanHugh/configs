export async function middleware(req) {
  const { hostname } = req.nextUrl;

  // Check if the subdomain is "setup.202583.xyz"
  if (hostname === 'setup.202583.xyz') {
    const redirectUrl = 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1';

    // Return the 301 redirect response
    return Response.redirect(redirectUrl, 301);
  }

  // If the subdomain is not matched, allow the request to continue
  return Response.next();
}

export const config = {
  matcher: '/',  // Apply middleware to the root path
};

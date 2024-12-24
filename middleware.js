export async function middleware(req) {
  const { hostname } = req.nextUrl;
  const userAgent = req.headers.get('user-agent') || '';  // Get the User-Agent header
  
  // Check if the subdomain is "setup.202583.xyz"
  if (hostname === 'setup.202583.xyz') {
    let redirectUrl = '';

    // Check for Windows-related keywords
    if (userAgent.includes('Windows')) {
      redirectUrl = 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/install.ps1'; // Windows redirect
    }
    // Check for macOS-related keywords
    else if (userAgent.includes('Mac') || userAgent.includes('Linux')) {
      redirectUrl = 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/install.sh'; // macOS & Linux redirect
    }
    else {
      // Default redirect if OS is not detected
      redirectUrl = 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/install.ps1'; // Other OSs (WIP ig?)
    }

    // Return the 301 redirect response
    return Response.redirect(redirectUrl, 301);
  }

  // If the subdomain is not matched, allow the request to continue
  return Response.next();
}

export const config = {
  matcher: '/',  // Apply middleware to the root path
};

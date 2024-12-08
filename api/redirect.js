export default function handler(req, res) {
  const protocol = req.headers['x-forwarded-proto'] || 'http'; // Detect protocol (http or https)
  
  if (protocol === 'http') {
    // If it's an HTTP request, redirect with a 301 status code
    res.redirect(301, 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1');
  } else {
    // Handle the request normally or perform another action if needed
    res.status(200).send('Request processed');
  }
}

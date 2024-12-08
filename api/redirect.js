export default function handler(req, res) {
  const hostname = req.headers.host;

  // Check if the subdomain is "setup.202583.xyz"
  if (hostname === 'setup.202583.xyz') {
    const redirectUrl = 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1';

    // Return a 301 redirect response
    return res.redirect(301, redirectUrl);
  }

  // If subdomain doesn't match, respond normally (you can customize this)
  res.status(404).send('Not Found');
}

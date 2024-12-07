export default function handler(req, res) {
  const host = req.headers.host;

  // Check if the request is from the subdomain you're targeting
  if (host === 'setup.202583.xyz') {
    // Redirect to the GitHub raw content
    return res.redirect(301, 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1');
  }

  // Default behavior for other domains or subdomains
  res.status(200).send('Content for main domain or other subdomains');
}

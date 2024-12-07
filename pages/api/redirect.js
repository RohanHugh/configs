export default function handler(req, res) {
  // Check the host (subdomain)
  const host = req.headers.host;

  if (host === 'setup.202583.xyz') {
    // Redirect to GitHub raw file for `get.mysite.com`
    return res.redirect(301, 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1');
  }

  // If not `get.mysite.com`, return a 404 or serve normal content
  res.status(404).send('Not Found');
}

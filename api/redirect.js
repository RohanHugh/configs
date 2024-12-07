export default function handler(req, res) {
  const host = req.headers.host;

  // Check if the request is coming to setup.202583.xyz
  if (host === 'setup.202583.xyz') {
    res.redirect(301, 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1');
  } else {
    // Allow other domains to load the regular content
    res.status(200).send('Index page or other content here');
  }
}

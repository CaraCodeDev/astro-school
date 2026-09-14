# astro-school

Setup for building and deploying Astro websites from a Mac.

## Before the first session

Open Terminal (press Cmd+Space, type Terminal, press Enter). Paste this and press Enter:

```bash
curl -fsSL https://raw.githubusercontent.com/CaraCodeDev/astro-school/main/setup.sh | bash
```

Three things will happen that need you:

1. A dialog asks to install command line tools. Click Install. When it finishes, run the command above again.
2. It asks for your Mac password once. Type it (nothing appears as you type, that's normal) and press Enter.
3. At the end it asks you to log in to GitHub. Choose GitHub.com, then HTTPS, then Yes, then Login with a web browser. It gives you a code, opens your browser, you paste the code.

Takes 10 to 20 minutes, mostly downloading. When it says Done, quit Terminal and open Ghostty instead. That's your terminal from now on.

## Accounts you need

Make these before the session if you don't have them:

- [GitHub](https://github.com/signup). Where the website's files live.
- [Cloudflare](https://dash.cloudflare.com/sign-up). Where the website is hosted.

## What got installed

| Thing | What it's for |
|---|---|
| Ghostty | The terminal. Prettier and faster than the built-in one. |
| Zed | Text editor for code. |
| git and gh | Track changes to files and talk to GitHub. |
| node and pnpm | Run Astro. |
| starship | The coloured prompt showing your folder and git branch. |

## If something goes wrong

Copy the last 20 or so lines of what the terminal printed and send them over. Don't retype, copy.

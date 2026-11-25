# DoxBon Web Builder

Web UI for uploading one Objective-C/Theos source file to a configured GitHub repository and dispatching the `build.yml` workflow. Build runs on GitHub Actions; the web server never compiles iOS binaries itself.

## Setup
1. Create a **private** GitHub repository and upload this project, preserving `.github/workflows/build.yml`.
2. Create a fine-grained GitHub token limited to that repository with **Contents: Read and write** and **Actions: Read and write** permissions.
3. Copy `.env.example` to `.env`, fill `GITHUB_TOKEN`, `GITHUB_OWNER`, `GITHUB_REPO`, `GITHUB_BRANCH`.
4. Run `npm install` then `npm start`; open `http://localhost:3000`.
5. Upload a `.m`, `.mm` or `.xm` file. Check the repository's Actions tab; download `doxbon-vds-build` artifact after success.

Deploy the Node server to a trusted host that supports environment secrets. Never commit `.env` or expose the token in frontend JavaScript. Add `.env` to `.gitignore`.

## Notes
- This is a GitHub Actions trigger frontend, not a browser-based compiler. GitHub performs the Theos build.
- The included workflow uses `beer-psi/theos-action@v1` to bootstrap Theos and SDKs. Theos requires an appropriate Apple SDK/toolchain; see the official docs: https://theos.dev/docs/installation-macos
- The included tweak source is DoxBon VDS 1.2. The QR scanning code is implemented; media replacement/insertion into Video Star's private project timeline is not implemented because no verified public integration API was supplied.
- Verify the Video Star bundle identifier and packaging target against the installed app before distributing. The included filter plist uses `com.frontierdesign.videostar` as a starting value and may need adjustment.
- Build artifacts are retrieved from GitHub Actions, not proxied through this web server.

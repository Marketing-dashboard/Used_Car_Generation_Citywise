# Used Car Campaigns Dashboard

A self-contained HTML dashboard (charts via Chart.js, no server needed) tracking
Spend / Leads / CPL by city and campaign type.

## Files

| File | Purpose |
|---|---|
| `Used_cars_data.xlsx` | Source data. **Replace this file** whenever you have a new export. |
| `template.html` | The dashboard's HTML/CSS/JS shell, with placeholders where data gets injected. Don't edit unless you're changing the design. |
| `build.py` | Reads the xlsx + template, generates `index.html`. **Run this after updating the data.** |
| `run_build.bat` | **Windows users: double-click this instead of build.py.** More reliable — it won't flash-close before you can read an error. |
| `index.html` | The generated, ready-to-view dashboard. This is what GitHub Pages serves. Don't hand-edit — it gets overwritten every time you run `build.py`. |

## Updating the dashboard with new data

1. Replace `Used_cars_data.xlsx` in this folder with your latest export (same filename).
2. **Windows**: double-click `run_build.bat`. **Mac**: open Terminal, `cd` into this folder, run `python3 build.py`.
3. It regenerates `index.html`. Open it locally in a browser to sanity-check.
4. Commit and push (see below) — GitHub Pages will pick up the change automatically.

### Troubleshooting: nothing seems to happen / window flashes and closes
This means Python hit an error before it could show you the message — usually one of:

- **`openpyxl` isn't installed.** Open a terminal/command prompt in this folder and run:
  `pip install openpyxl` (or `pip3 install openpyxl` / `python -m pip install openpyxl`)
- **Double-clicking `build.py` directly opens it in a text editor instead of running it.**
  Use `run_build.bat` instead (Windows) — it explicitly calls Python and stays open no matter what happens, so you'll always see the error if one occurs.
- **Python isn't installed at all**, or isn't on your system PATH. Install it from
  [python.org](https://python.org) and make sure to check "Add Python to PATH" during setup.

If `index.html`'s file "last modified" timestamp hasn't changed after you run the build, the
build didn't actually complete — check for one of the above.

## Hosting on GitHub Pages with GitHub Desktop

**One-time setup:**

1. Install [GitHub Desktop](https://desktop.github.com/) and sign in with your GitHub account.
2. In GitHub Desktop: **File → New Repository**
   - Name it (e.g. `used-car-dashboard`)
   - Set the **Local Path** to a folder on your computer
   - Leave "Initialize with a README" unchecked (we already have one)
3. Copy all the files from this folder (`Used_cars_data.xlsx`, `template.html`, `build.py`, `index.html`, `README.md`) into that new repository folder GitHub Desktop just created.
4. Back in GitHub Desktop, you'll see all the files listed as changes. Write a commit message (e.g. "Initial dashboard"), click **Commit to main**.
5. Click **Publish repository** (top bar). Choose whether it's public or private, then publish.
6. On GitHub.com, open the repository → **Settings → Pages**.
   - Under "Build and deployment" → Source: **Deploy from a branch**
   - Branch: **main**, folder: **/ (root)** → Save
7. Wait ~1 minute, then refresh that Pages settings page — it'll show your live URL, something like:
   `https://<your-username>.github.io/used-car-dashboard/`

That URL always serves whatever `index.html` currently is in the repo.

**Every time you get new data:**

1. Replace `Used_cars_data.xlsx`, run `build.py` (as above).
2. Open GitHub Desktop — it'll show `index.html` (and the updated xlsx) as changed files.
3. Write a commit message (e.g. "Update data through 08 Jul"), **Commit to main**.
4. Click **Push origin**.
5. Give it a minute — GitHub Pages redeploys automatically. Refresh your dashboard URL.

No need to touch Settings → Pages again after the first-time setup.
